import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../tv_helper/test_helper.mock.dart';

void main() {
  late GetPopularTv usecase;
  late MockTvRepository mockTvRpository;

  setUp(() {
    mockTvRpository = MockTvRepository();
    usecase = GetPopularTv(mockTvRpository);
  });

  final tTv = <Tv>[];

  group('Get Popular Tv Tests', () {
    group('execute', () {
      test(
          'should get list of tv from the repository when execute function is called',
              () async {
            // arrange
            when(mockTvRpository.getPopularTv())
                .thenAnswer((_) async => Right(tTv));
            // act
            final result = await usecase.execute();
            // assert
            expect(result, Right(tTv));
          });
    });
  });
}
