import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_top_rated_bloc_test.mock.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MovieTopRatedBloc topRatedMoviesBloc;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    topRatedMoviesBloc = MovieTopRatedBloc(mockGetTopRatedMovies);
  });

  test('the TopRatedMoviesEmpty initial state should be empty ', () {
    expect(topRatedMoviesBloc.state, MovieTopRatedEmpty());
  });

  blocTest<MovieTopRatedBloc, MovieTopRatedState>(
    'should emits PopularMovieLoading state and then PopularMovieHasData state when data is successfully fetched..',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return topRatedMoviesBloc;
    },
    act: (bloc) => bloc.add(OnMovieTopRatedCalled()),
    expect: () => <MovieTopRatedState>[
      MovieTopRatedLoading(),
      MovieTopRatedHasData(testMovieList),
    ],
    verify: (bloc) => verify(mockGetTopRatedMovies.execute()),
  );

  blocTest<MovieTopRatedBloc, MovieTopRatedState>(
    'should emits TopRatedMoviesLoading state and then TopRatedMoviesError state when data is failed fetched..',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return topRatedMoviesBloc;
    },
    act: (bloc) => bloc.add(OnMovieTopRatedCalled()),
    expect: () => <MovieTopRatedState>[
      MovieTopRatedLoading(),
      MovieTopRatedError('Server Failure'),
    ],
    verify: (bloc) => MovieTopRatedLoading(),
  );

  blocTest<MovieTopRatedBloc, MovieTopRatedState>(
    'should emits TopRatedMoviesLoading state and then TopRatedMoviesEmpty state when data is retrieved empty..',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => const Right([]));
      return topRatedMoviesBloc;
    },
    act: (bloc) => bloc.add(OnMovieTopRatedCalled()),
    expect: () => <MovieTopRatedState>[
      MovieTopRatedLoading(),
      MovieTopRatedEmpty(),
    ],
  );
}
