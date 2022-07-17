import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_recommendation_bloc_test.mock.dart';

@GenerateMocks([GetMovieRecommendations])
void main() {
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MovieRecommendationBloc movieRecommendationsBloc;

  const testId = 1;

  setUp(() {
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    movieRecommendationsBloc =
        MovieRecommendationBloc(mockGetMovieRecommendations);
  });

  test('the MovieRecommendationsEmpty initial state should be empty ', () {
    expect(movieRecommendationsBloc.state, MovieRecommendationEmpty());
  });

  blocTest<MovieRecommendationBloc, MovieRecommendationState>(
    'should emits PopularMovieLoading state and then PopularMovieHasData state when data is successfully fetched..',
    build: () {
      when(mockGetMovieRecommendations.execute(testId))
          .thenAnswer((_) async => Right(testMovieList));
      return movieRecommendationsBloc;
    },
    act: (bloc) => bloc.add(OnMovieRecommendationCalled(testId)),
    expect: () => <MovieRecommendationState>[
      MovieRecommendationLoading(),
      MovieRecommendationHasData(testMovieList),
    ],
    verify: (bloc) => verify(mockGetMovieRecommendations.execute(testId)),
  );

  blocTest<MovieRecommendationBloc, MovieRecommendationState>(
    'should emits MovieRecommendationsLoading state and then MovieRecommendationsError state when data is failed fetched..',
    build: () {
      when(mockGetMovieRecommendations.execute(testId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return movieRecommendationsBloc;
    },
    act: (bloc) => bloc.add(OnMovieRecommendationCalled(testId)),
    expect: () => <MovieRecommendationState>[
      MovieRecommendationLoading(),
      MovieRecommendationError('Server Failure'),
    ],
    verify: (bloc) => MovieRecommendationLoading(),
  );

  blocTest<MovieRecommendationBloc, MovieRecommendationState>(
    'should emits MovieRecommendationsLoading state and then MovieRecommendationsEmpty state when data is retrieved empty..',
    build: () {
      when(mockGetMovieRecommendations.execute(testId))
          .thenAnswer((_) async => const Right([]));
      return movieRecommendationsBloc;
    },
    act: (bloc) => bloc.add(OnMovieRecommendationCalled(testId)),
    expect: () => <MovieRecommendationState>[
      MovieRecommendationLoading(),
      MovieRecommendationEmpty(),
    ],
  );
}
