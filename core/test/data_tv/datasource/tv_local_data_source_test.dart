import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/test_helper.mock.dart';

void main() {
  late TvLocalDataSourceImpl dataSourcetv;
  late MockDatabaseHelperTv mockDatabaseHelperTv;

  setUp(() {
    mockDatabaseHelperTv = MockDatabaseHelperTv();
    dataSourcetv =
        TvLocalDataSourceImpl(databaseHelper: mockDatabaseHelperTv);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
            () async {
          // arrange
          when(mockDatabaseHelperTv.insertWatchlistTv(testTvSeriesTable))
              .thenAnswer((_) async => 1);
          // act
          final result = await dataSourcetv.insertWatchlist(testTvSeriesTable);
          // assert
          expect(result, 'Added to Watchlist');
        });

    test('should throw DatabaseException when insert to database is failed',
            () async {
          // arrange
          when(mockDatabaseHelperTv.insertWatchlistTv(testTvSeriesTable))
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
          when(mockDatabaseHelperTv.removeWatchlistTv(testTvSeriesTable))
              .thenAnswer((_) async => 1);
          // act
          final result = await dataSourcetv.removeWatchlist(testTvSeriesTable);
          // assert
          expect(result, 'Removed from Watchlist');
        });

    test('should throw DatabaseException when remove from database is failed',
            () async {
          // arrange
          when(mockDatabaseHelperTv.removeWatchlistTv(testTvSeriesTable))
              .thenThrow(Exception());
          // act
          final call = dataSourcetv.removeWatchlist(testTvSeriesTable);
          // assert
          expect(() => call, throwsA(isA<DatabaseException>()));
        });
  });

  group('Get TV Detail By Id', () {
    const tId = 1;

    test('should return TV Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelperTv.getTvById(tId))
          .thenAnswer((_) async => testTvSeriesMap);
      // act
      final result = await dataSourcetv.getTvById(tId);
      // assert
      expect(result, testTvSeriesTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelperTv.getTvById(tId))
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
      when(mockDatabaseHelperTv.getWatchlistTv())
          .thenAnswer((_) async => [testTvSeriesMap]);
      // act
      final result = await dataSourcetv.getWatchlistTv();
      // assert
      expect(result, [testTvSeriesTable]);
    });
  });
}
