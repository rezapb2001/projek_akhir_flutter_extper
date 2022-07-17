import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_popular_bloc_test.mock.dart';


@GenerateMocks([GetPopularTv])
void main() {
  late MockGetPopularTv mockGetTvPopular;
  late TvPopularBloc tvPopularBloc;

  setUp(() {
    mockGetTvPopular = MockGetPopularTv();
    tvPopularBloc = TvPopularBloc(mockGetTvPopular);
  });

  test('the TvPopularEmpty initial state should be empty ', () {
    expect(tvPopularBloc.state, TvPopularEmpty());
  });

  blocTest<TvPopularBloc, TvPopularState>(
    'should emits TvPopularLoading state and then TvPopularHasData state when data is successfully fetched..',
    build: () {
      when(mockGetTvPopular.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return tvPopularBloc;
    },
    act: (bloc) => bloc.add(OnTvPopularCalled()),
    expect: () => <TvPopularState>[
      TvPopularLoading(),
      TvPopularHasData(testTvSeriesList),
    ],
    verify: (bloc) => verify(mockGetTvPopular.execute()),
  );

  blocTest<TvPopularBloc, TvPopularState>(
    'should emits TvPopularLoading state and then TvPopularError state when data is failed fetched..',
    build: () {
      when(mockGetTvPopular.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvPopularBloc;
    },
    act: (bloc) => bloc.add(OnTvPopularCalled()),
    expect: () => <TvPopularState>[
      TvPopularLoading(),
      TvPopularError('Server Failure'),
    ],
    verify: (bloc) => TvPopularLoading(),
  );

  blocTest<TvPopularBloc, TvPopularState>(
    'should emits TvPopularLoading state and then TvPopularEmpty state when data is retrieved empty..',
    build: () {
      when(mockGetTvPopular.execute())
          .thenAnswer((_) async => const Right([]));
      return tvPopularBloc;
    },
    act: (bloc) => bloc.add(OnTvPopularCalled()),
    expect: () => <TvPopularState>[
      TvPopularLoading(),
      TvPopularEmpty(),
    ],
  );
}
