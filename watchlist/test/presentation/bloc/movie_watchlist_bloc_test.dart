import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/watchlist.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_watchlist_bloc_test.mock.dart';

@GenerateMocks(
    [GetWatchListStatus, GetWatchlistMovies, RemoveWatchlist, SaveWatchlist])
void main() {
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late MockGetWatchListStatus mockGetWatchListStatusMovies;
  late MockRemoveWatchlist mockRemoveWatchlistMovies;
  late MockSaveWatchlist mockSaveWatchlistMovies;
  late MoviesWatchlistBloc watchlistMoviesBloc;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    mockGetWatchListStatusMovies = MockGetWatchListStatus();
    mockRemoveWatchlistMovies = MockRemoveWatchlist();
    mockSaveWatchlistMovies = MockSaveWatchlist();
    watchlistMoviesBloc = MoviesWatchlistBloc(
      mockGetWatchlistMovies,
      mockGetWatchListStatusMovies,
      mockRemoveWatchlistMovies,
      mockSaveWatchlistMovies,
    );
  });

  test('the WatchlistMoviesEmpty initial state should be empty ', () {
    expect(watchlistMoviesBloc.state, MoviesWatchlistEmpty());
  });

  group('get watchlist movies test cases', () {
    blocTest<MoviesWatchlistBloc, MoviesWatchlistState>(
      'should emits WatchlistMovieLoading state and then WatchlistMovieHasData state when data is successfully fetched..',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Right([testWatchlistMovie]));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(OnMoviesWatchlistCalled()),
      expect: () => [
        MoviesWatchlistLoading(),
        MoviesWatchlistHasData([testWatchlistMovie]),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistMovies.execute());
        return OnMoviesWatchlistCalled().props;
      },
    );

    blocTest<MoviesWatchlistBloc, MoviesWatchlistState>(
      'should emits WatchlistMoviesLoading state and then WatchlistMoviesError state when data is failed fetched..',
      build: () {
        when(mockGetWatchlistMovies.execute()).thenAnswer(
                (_) async => Left(ServerFailure('Server Failure')));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(OnMoviesWatchlistCalled()),
      expect: () => <MoviesWatchlistState>[
        MoviesWatchlistLoading(),
        MoviesWatchlistError('Server Failure'),
      ],
      verify: (bloc) => MoviesWatchlistLoading(),
    );

    blocTest<MoviesWatchlistBloc, MoviesWatchlistState>(
      'should emits WatchlistMoviesLoading state and then WatchlistMoviesEmpty state when data is retrieved empty..',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => const Right([]));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(OnMoviesWatchlistCalled()),
      expect: () => <MoviesWatchlistState>[
        MoviesWatchlistLoading(),
        MoviesWatchlistEmpty(),
      ],
    );
  });

  group('get watchlist status movies test cases', () {
    blocTest<MoviesWatchlistBloc, MoviesWatchlistState>(
      'should be return true when the watchlist is also true',
      build: () {
        when(mockGetWatchListStatusMovies.execute(testMovieDetail.id))
            .thenAnswer((_) async => true);
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(FetchMovieWatchlistStatus(testMovieDetail.id)),
      expect: () => [MoviesWatchlistIsAdded(true)],
      verify: (bloc) {
        verify(mockGetWatchListStatusMovies.execute(testMovieDetail.id));
        return FetchMovieWatchlistStatus(testMovieDetail.id).props;
      },
    );

    blocTest<MoviesWatchlistBloc, MoviesWatchlistState>(
        'should be return false when the watchlist is also false',
        build: () {
          when(mockGetWatchListStatusMovies.execute(testMovieDetail.id))
              .thenAnswer((_) async => false);
          return watchlistMoviesBloc;
        },
        act: (bloc) => bloc.add(FetchMovieWatchlistStatus(testMovieDetail.id)),
        expect: () => <MoviesWatchlistState>[
          MoviesWatchlistIsAdded(false),
        ],
        verify: (bloc) {
          verify(mockGetWatchListStatusMovies.execute(testMovieDetail.id));
          return FetchMovieWatchlistStatus(testMovieDetail.id).props;
        });
  });

  group('add watchlist test cases', () {
    blocTest<MoviesWatchlistBloc, MoviesWatchlistState>(
      'should update watchlist status when adding movie to watchlist is successfully',
      build: () {
        when(mockSaveWatchlistMovies.execute(testMovieDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist'));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(AddMovieToWatchlist(testMovieDetail)),
      expect: () => [
        MoviesWatchlistMessage('Added to Watchlist'),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlistMovies.execute(testMovieDetail));
        return AddMovieToWatchlist(testMovieDetail).props;
      },
    );

    blocTest<MoviesWatchlistBloc, MoviesWatchlistState>(
      'should throw failure message status when adding movie to watchlist is failed',
      build: () {
        when(mockSaveWatchlistMovies.execute(testMovieDetail)).thenAnswer(
                (_) async =>
            Left(DatabaseFailure('can\'t add data to watchlist')));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(AddMovieToWatchlist(testMovieDetail)),
      expect: () => [
        MoviesWatchlistError('can\'t add data to watchlist'),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlistMovies.execute(testMovieDetail));
        return AddMovieToWatchlist(testMovieDetail).props;
      },
    );
  });

  group('remove watchlist test cases', () {
    blocTest<MoviesWatchlistBloc, MoviesWatchlistState>(
      'should update watchlist status when removing movie from watchlist is successfully',
      build: () {
        when(mockRemoveWatchlistMovies.execute(testMovieDetail))
            .thenAnswer((_) async => const Right('Removed from Watchlist'));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(RemoveMovieFromWatchlist(testMovieDetail)),
      expect: () => [
        MoviesWatchlistMessage('Removed from Watchlist'),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlistMovies.execute(testMovieDetail));
        return RemoveMovieFromWatchlist(testMovieDetail).props;
      },
    );

    blocTest<MoviesWatchlistBloc, MoviesWatchlistState>(
      'should throw failure message status when removie movie from watchlist is failed',
      build: () {
        when(mockRemoveWatchlistMovies.execute(testMovieDetail)).thenAnswer(
                (_) async =>
            Left(DatabaseFailure('can\'t add data to watchlist')));
        return watchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(RemoveMovieFromWatchlist(testMovieDetail)),
      expect: () => [
        MoviesWatchlistError('can\'t add data to watchlist'),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlistMovies.execute(testMovieDetail));
        return RemoveMovieFromWatchlist(testMovieDetail).props;
      },
    );
  });
}
