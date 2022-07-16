import 'package:core/core.dart';
import 'package:tv_series/tv_series.dart';

import 'package:dartz/dartz.dart';

class GetRecommendationTv {
  final TvRepository repository;

  GetRecommendationTv(this.repository);

  Future<Either<Failure, List<Tv>>> execute(id) {
    return repository.getTvRecommendations(id);
  }
}
