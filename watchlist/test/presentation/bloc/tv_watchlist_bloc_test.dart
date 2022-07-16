import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/watchlist.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_watchlist_bloc_test.mock.dart';

@GenerateMocks([
  GetWatchListStatusTv,
  GetWatchlistTv,
  RemoveWatchlistTv,
  SaveWatchlistTv
])
void main() {
  late MockGetWatchlistTv mockGetWatchlistTv;
  late MockGetWatchListStatusTv mockGetWatchListStatusTv;
  late MockRemoveWatchlistTv mockRemoveWatchlistTv;
  late MockSaveWatchlistTv mockSaveWatchlistTv;
  late TvWatchlistBloc watchlistTvBloc;

  setUp(() {
    mockGetWatchlistTv = MockGetWatchlistTv();
    mockGetWatchListStatusTv = MockGetWatchListStatusTv();
    mockRemoveWatchlistTv = MockRemoveWatchlistTv();
    mockSaveWatchlistTv = MockSaveWatchlistTv();
    watchlistTvBloc = TvWatchlistBloc(
      mockGetWatchlistTv,
      mockGetWatchListStatusTv,
      mockRemoveWatchlistTv,
      mockSaveWatchlistTv,
    );
  });

  test('the WatchlisttvEmpty initial state should be empty ', () {
    expect(watchlistTvBloc.state, TvWatchlistEmpty());
  });

  group('get watchlist movies test cases', () {
    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'should emits WatchlistMovieLoading state and then WatchlistMovieHasData state when data is successfully fetched..',
      build: () {
        when(mockGetWatchlistTv.execute())
            .thenAnswer((_) async => Right([testWatchlistTvSeries]));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(OnTvWatchlistCalled()),
      expect: () => [
        TvWatchlistLoading(),
        TvWatchlistHasData([testWatchlistTvSeries]),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTv.execute());
        return OnTvWatchlistCalled().props;
      },
    );

    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'should emits WatchlistMoviesLoading state and then WatchlistMoviesError state when data is failed fetched..',
      build: () {
        when(mockGetWatchlistTv.execute()).thenAnswer(
                (_) async => Left(ServerFailure('Server Failure')));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(OnTvWatchlistCalled()),
      expect: () => <TvWatchlistState>[
        TvWatchlistLoading(),
        TvWatchlistError('Server Failure'),
      ],
      verify: (bloc) => TvWatchlistLoading(),
    );

    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'should emits WatchlistMoviesLoading state and then WatchlistMoviesEmpty state when data is retrieved empty..',
      build: () {
        when(mockGetWatchlistTv.execute())
            .thenAnswer((_) async => const Right([]));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(OnTvWatchlistCalled()),
      expect: () => <TvWatchlistState>[
        TvWatchlistLoading(),
        TvWatchlistEmpty(),
      ],
    );
  });

  group('get watchlist status movies test cases', () {
    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'should be return true when the watchlist is also true',
      build: () {
        when(mockGetWatchListStatusTv.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => true);
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(FetchTvWatchlistStatus(testTvSeriesDetail.id)),
      expect: () => [TvWatchlistIsAdded(true)],
      verify: (bloc) {
        verify(mockGetWatchListStatusTv.execute(testTvSeriesDetail.id));
        return FetchTvWatchlistStatus(testTvSeriesDetail.id).props;
      },
    );

    blocTest<TvWatchlistBloc, TvWatchlistState>(
        'should be return false when the watchlist is also false',
        build: () {
          when(mockGetWatchListStatusTv.execute(testTvSeriesDetail.id))
              .thenAnswer((_) async => false);
          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(FetchTvWatchlistStatus(testTvSeriesDetail.id)),
        expect: () => <TvWatchlistState>[
          TvWatchlistIsAdded(false),
        ],
        verify: (bloc) {
          verify(mockGetWatchListStatusTv.execute(testTvSeriesDetail.id));
          return FetchTvWatchlistStatus(testTvSeriesDetail.id).props;
        });
  });

  group('add watchlist test cases', () {
    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'should update watchlist status when adding movie to watchlist is successfully',
      build: () {
        when(mockSaveWatchlistTv.execute(testTvSeriesDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist'));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(AddTvToWatchlist(testTvSeriesDetail)),
      expect: () => [
        TvWatchlistMessage('Added to Watchlist'),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlistTv.execute(testTvSeriesDetail));
        return AddTvToWatchlist(testTvSeriesDetail).props;
      },
    );

    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'should throw failure message status when adding movie to watchlist is failed',
      build: () {
        when(mockSaveWatchlistTv.execute(testTvSeriesDetail)).thenAnswer(
                (_) async =>
            Left(DatabaseFailure('can\'t add data to watchlist')));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(AddTvToWatchlist(testTvSeriesDetail)),
      expect: () => [
        TvWatchlistError('can\'t add data to watchlist'),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlistTv.execute(testTvSeriesDetail));
        return AddTvToWatchlist(testTvSeriesDetail).props;
      },
    );
  });

  group('remove watchlist test cases', () {
    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'should update watchlist status when removing movie from watchlist is successfully',
      build: () {
        when(mockRemoveWatchlistTv.execute(testTvSeriesDetail))
            .thenAnswer((_) async => const Right('Removed from Watchlist'));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(RemoveTvFromWatchlist(testTvSeriesDetail)),
      expect: () => [
        TvWatchlistMessage('Removed from Watchlist'),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlistTv.execute(testTvSeriesDetail));
        return RemoveTvFromWatchlist(testTvSeriesDetail).props;
      },
    );

    blocTest<TvWatchlistBloc, TvWatchlistState>(
      'should throw failure message status when removie movie from watchlist is failed',
      build: () {
        when(mockRemoveWatchlistTv.execute(testTvSeriesDetail)).thenAnswer(
                (_) async =>
            Left(DatabaseFailure('can\'t add data to watchlist')));
        return watchlistTvBloc;
      },
      act: (bloc) => bloc.add(RemoveTvFromWatchlist(testTvSeriesDetail)),
      expect: () => [
        TvWatchlistError('can\'t add data to watchlist'),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlistTv.execute(testTvSeriesDetail));
        return RemoveTvFromWatchlist(testTvSeriesDetail).props;
      },
    );
  });
}
