import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/watchlist.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../watchlisthelper/test_helper.mock.dart';

void main() {
  late SaveWatchlistTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = SaveWatchlistTv(mockTvRepository);
  });

  test('should save tv_series to the repository', () async {
    // arrange
    when(mockTvRepository.saveWatchlistTv(testTvSeriesDetail))
        .thenAnswer((_) async => const Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testTvSeriesDetail);
    // assert
    verify(mockTvRepository.saveWatchlistTv(testTvSeriesDetail));
    expect(result, const Right('Added to Watchlist'));
  });
}
