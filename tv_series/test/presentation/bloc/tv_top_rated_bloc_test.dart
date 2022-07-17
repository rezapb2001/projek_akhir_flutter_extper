import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_top_rated_bloc_test.mock.dart';

@GenerateMocks([GetTopRatedTv])
void main() {
  late MockGetTopRatedTv mockGetTvTopRated;
  late TvTopRatedBloc tvTopRatedBloc;

  setUp(() {
    mockGetTvTopRated = MockGetTopRatedTv();
    tvTopRatedBloc = TvTopRatedBloc(mockGetTvTopRated);
  });

  test('the TvTopRatedEmpty initial state should be empty ', () {
    expect(tvTopRatedBloc.state, TvTopRatedEmpty());
  });

  blocTest<TvTopRatedBloc, TvTopRatedState>(
    'should emits PopularTvLoading state and then PopularTvHasData state when data is successfully fetched..',
    build: () {
      when(mockGetTvTopRated.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return tvTopRatedBloc;
    },
    act: (bloc) => bloc.add(OnTvTopRatedCalled()),
    expect: () => <TvTopRatedState>[
      TvTopRatedLoading(),
      TvTopRatedHasData(testTvSeriesList),
    ],
    verify: (bloc) => verify(mockGetTvTopRated.execute()),
  );

  blocTest<TvTopRatedBloc, TvTopRatedState>(
    'should emits TvTopRatedLoading state and then TvTopRatedError state when data is failed fetched..',
    build: () {
      when(mockGetTvTopRated.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvTopRatedBloc;
    },
    act: (bloc) => bloc.add(OnTvTopRatedCalled()),
    expect: () => <TvTopRatedState>[
      TvTopRatedLoading(),
      TvTopRatedError('Server Failure'),
    ],
    verify: (bloc) => TvTopRatedLoading(),
  );

  blocTest<TvTopRatedBloc, TvTopRatedState>(
    'should emits TvTopRatedLoading state and then TvTopRatedEmpty state when data is retrieved empty..',
    build: () {
      when(mockGetTvTopRated.execute())
          .thenAnswer((_) async => const Right([]));
      return tvTopRatedBloc;
    },
    act: (bloc) => bloc.add(OnTvTopRatedCalled()),
    expect: () => <TvTopRatedState>[
      TvTopRatedLoading(),
      TvTopRatedEmpty(),
    ],
  );
}
