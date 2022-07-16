import 'package:ditonton/utils/exception.dart';
import 'package:ditonton/domain/datasources/db/tv/tv_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvLocalDataSourceImpl dataSourcetv;
  late MockDatabaseHelperTv mockDatabaseHelperTvSeries;

  setUp(() {
    mockDatabaseHelperTvSeries = MockDatabaseHelperTv();
    dataSourcetv =
        TvLocalDataSourceImpl(databaseHelper: mockDatabaseHelperTvSeries);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
            () async {
          // arrange
          when(mockDatabaseHelperTvSeries.insertWatchlistTv(testTvSeriesTable))
              .thenAnswer((_) async => 1);
          // act
          final result = await dataSourcetv.insertWatchlist(testTvSeriesTable);
          // assert
          expect(result, 'Added to Watchlist');
        });

    test('should throw DatabaseException when insert to database is failed',
            () async {
          // arrange
          when(mockDatabaseHelperTvSeries.insertWatchlistTv(testTvSeriesTable))
              .thenThrow(Exception());
          // act
          final call = dataSourcetv.insertWatchlist(testTvSeriesTable);
          // assert
          expect(() => call, throwsA(isA<DatabaseException>()));
        });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
            () async {
          // arrange
          when(mockDatabaseHelperTvSeries.removeWatchlistTv(testTvSeriesTable))
              .thenAnswer((_) async => 1);
          // act
          final result = await dataSourcetv.removeWatchlist(testTvSeriesTable);
          // assert
          expect(result, 'Removed from Watchlist');
        });

    test('should throw DatabaseException when remove from database is failed',
            () async {
          // arrange
          when(mockDatabaseHelperTvSeries.removeWatchlistTv(testTvSeriesTable))
              .thenThrow(Exception());
          // act
          final call = dataSourcetv.removeWatchlist(testTvSeriesTable);
          // assert
          expect(() => call, throwsA(isA<DatabaseException>()));
        });
  });

  group('Get TV Detail By Id', () {
    final tId = 1;

    test('should return TV Detail Table when domain is found', () async {
      // arrange
      when(mockDatabaseHelperTvSeries.getTvById(tId))
          .thenAnswer((_) async => testTvSeriesMap);
      // act
      final result = await dataSourcetv.getTvById(tId);
      // assert
      expect(result, testTvSeriesTable);
    });

    test('should return null when domain is not found', () async {
      // arrange
      when(mockDatabaseHelperTvSeries.getTvById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await dataSourcetv.getTvById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist TV', () {
    test('should return list of TV Table from database', () async {
      // arrange
      when(mockDatabaseHelperTvSeries.getWatchlistTv())
          .thenAnswer((_) async => [testTvSeriesMap]);
      // act
      final result = await dataSourcetv.getWatchlistTv();
      // assert
      expect(result, [testTvSeriesTable]);
    });
  });
}
