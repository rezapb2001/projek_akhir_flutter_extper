import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_popular_bloc_test.mock.dart';

@GenerateMocks([GetPopularMovies])
void main() {
  late MockGetPopularMovies mockGetPopularMovies;
  late MoviePopularBloc moviePopularBloc;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    moviePopularBloc = MoviePopularBloc(mockGetPopularMovies);
  });

  test('the PopularMoviesEmpty initial state should be empty ', () {
    expect(moviePopularBloc.state, MoviePopularEmpty());
  });

  blocTest<MoviePopularBloc, MoviePopularState>(
    'should emits PopularMovieLoading state and then PopularMovieHasData state when data is successfully fetched..',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return moviePopularBloc;
    },
    act: (bloc) => bloc.add(OnMoviePopularCalled()),
    expect: () => <MoviePopularState>[
      MoviePopularLoading(),
      MoviePopularHasData(testMovieList),
    ],
    verify: (bloc) => verify(mockGetPopularMovies.execute()),
  );

  blocTest<MoviePopularBloc, MoviePopularState>(
    'should emits PopularMoviesLoading state and then PopularMoviesError state when data is failed fetched..',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return moviePopularBloc;
    },
    act: (bloc) => bloc.add(OnMoviePopularCalled()),
    expect: () => <MoviePopularState>[
      MoviePopularLoading(),
      MoviePopularError('Server Failure'),
    ],
    verify: (bloc) => MoviePopularLoading(),
  );

  blocTest<MoviePopularBloc, MoviePopularState>(
    'should emits PopularMoviesLoading state and then PopularMoviesEmpty state when data is retrieved empty..',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => const Right([]));
      return moviePopularBloc;
    },
    act: (bloc) => bloc.add(OnMoviePopularCalled()),
    expect: () => <MoviePopularState>[
      MoviePopularLoading(),
      MoviePopularEmpty(),
    ],
  );
}
