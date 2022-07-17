import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_detail_bloc_test.mock.dart';

@GenerateMocks([GetDetailTv])
void main() {
  late MockGetTvDetail mockGetTvDetail;
  late TvDetailBloc tvDetailBloc;

  const testId = 1;

  setUp(() {
    mockGetTvDetail = MockGetTvDetail();
    tvDetailBloc = TvDetailBloc(mockGetTvDetail);
  });
  test('the TvDetailBloc initial state should be empty', () {
    expect(tvDetailBloc.state, TvDetailEmpty());
  });

  blocTest<TvDetailBloc, TvDetailState>(
      'should emits TvDetailLoading state and then TvDetailHasData state when data is successfully fetched.',
      build: () {
        when(mockGetTvDetail.execute(testId))
            .thenAnswer((_) async => Right(testTvSeriesDetail));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(OnTvDetailCalled(testId)),
      expect: () => <TvDetailState>[
        TvDetailLoading(),
        TvDetailHasData(testTvSeriesDetail),
      ],
      verify: (bloc) {
        verify(mockGetTvDetail.execute(testId));
        return OnTvDetailCalled(testId).props;
      });

  blocTest<TvDetailBloc, TvDetailState>(
    'should emits TvDetailLoading state and TvDetailError when data is failed to fetch.',
    build: () {
      when(mockGetTvDetail.execute(testId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvDetailBloc;
    },
    act: (bloc) => bloc.add(OnTvDetailCalled(testId)),
    expect: () => <TvDetailState>[
      TvDetailLoading(),
      TvDetailError('Server Failure'),
    ],
    verify: (bloc) => TvDetailLoading(),
  );
}
