import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_now_playing_bloc_test.mock.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late MockGetNowPlayingMovies mockGetNowPlayingMovie;
  late MovieNowPlayingBloc nowPlayingMovieBloc;

  setUp(() {
    mockGetNowPlayingMovie = MockGetNowPlayingMovies();
    nowPlayingMovieBloc = MovieNowPlayingBloc(mockGetNowPlayingMovie);
  });

  test('the NowPlayingMovieBloc initial state should be empty ', () {
    expect(nowPlayingMovieBloc.state, MovieNowPlayingEmpty());
  });

  blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
      'should emits NowPlayingMovieLoading state and then NowPlayingMovieHasData state when data is successfully fetched..',
      build: () {
        when(mockGetNowPlayingMovie.execute())
            .thenAnswer((_) async => Right(testMovieList));
        return nowPlayingMovieBloc;
      },
      act: (bloc) => bloc.add(OnMovieNowPlayingCalled()),
      expect: () => <MovieNowPlayingState>[
        MovieNowPlayingLoading(),
        MovieNowPlayingHasData(testMovieList),
      ],
      verify: (bloc) {
        verify(mockGetNowPlayingMovie.execute());
        return OnMovieNowPlayingCalled().props;
      });

  blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
    'should emits NowPlayingMovieLoading state and then NowPlayingMovieError state when data is failed fetched..',
    build: () {
      when(mockGetNowPlayingMovie.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return nowPlayingMovieBloc;
    },
    act: (bloc) => bloc.add(OnMovieNowPlayingCalled()),
    expect: () => <MovieNowPlayingState>[
      MovieNowPlayingLoading(),
      MovieNowPlayingError('Server Failure'),
    ],
    verify: (bloc) => MovieNowPlayingLoading(),
  );

  blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
    'should emits NowPlayingMovieLoading state and then NowPlayingMovieEmpty state when data is retrieved empty..',
    build: () {
      when(mockGetNowPlayingMovie.execute())
          .thenAnswer((_) async => const Right([]));
      return nowPlayingMovieBloc;
    },
    act: (bloc) => bloc.add(OnMovieNowPlayingCalled()),
    expect: () => <MovieNowPlayingState>[
      MovieNowPlayingLoading(),
      MovieNowPlayingEmpty(),
    ],
  );
}
