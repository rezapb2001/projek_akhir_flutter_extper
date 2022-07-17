import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_recommendation_bloc_test.mock.dart';

@GenerateMocks([GetRecommendationTv])
void main() {
  late MockGetTvRecommendations mockGetTvRecommendations;
  late TvRecommendationBloc tvRecommendationBloc;

  const testId = 1;

  setUp(() {
    mockGetTvRecommendations = MockGetTvRecommendations();
    tvRecommendationBloc =
        TvRecommendationBloc(mockGetTvRecommendations);
  });

  test('the TvRecommendationsEmpty initial state should be empty ', () {
    expect(tvRecommendationBloc.state, TvRecommendationEmpty());
  });

  blocTest<TvRecommendationBloc, TvRecommendationState>(
    'should emits PopularTvLoading state and then PopularTvHasData state when data is successfully fetched..',
    build: () {
      when(mockGetTvRecommendations.execute(testId))
          .thenAnswer((_) async => Right(testTvSeriesList));
      return tvRecommendationBloc;
    },
    act: (bloc) => bloc.add(OnTvRecommendationCalled(testId)),
    expect: () => <TvRecommendationState>[
      TvRecommendationLoading(),
      TvRecommendationHasData(testTvSeriesList),
    ],
    verify: (bloc) => verify(mockGetTvRecommendations.execute(testId)),
  );

  blocTest<TvRecommendationBloc, TvRecommendationState>(
    'should emits TvRecommendationsLoading state and then TvRecommendationsError state when data is failed fetched..',
    build: () {
      when(mockGetTvRecommendations.execute(testId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvRecommendationBloc;
    },
    act: (bloc) => bloc.add(OnTvRecommendationCalled(testId)),
    expect: () => <TvRecommendationState>[
      TvRecommendationLoading(),
      TvRecommendationError('Server Failure'),
    ],
    verify: (bloc) => TvRecommendationLoading(),
  );

  blocTest<TvRecommendationBloc, TvRecommendationState>(
    'should emits TvRecommendationsLoading state and then TvRecommendationsEmpty state when data is retrieved empty..',
    build: () {
      when(mockGetTvRecommendations.execute(testId))
          .thenAnswer((_) async => const Right([]));
      return tvRecommendationBloc;
    },
    act: (bloc) => bloc.add(OnTvRecommendationCalled(testId)),
    expect: () => <TvRecommendationState>[
      TvRecommendationLoading(),
      TvRecommendationEmpty(),
    ],
  );
}
