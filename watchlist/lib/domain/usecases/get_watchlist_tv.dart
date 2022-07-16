import 'package:core/core.dart';
import 'package:tv_series/tv_series.dart';

import 'package:dartz/dartz.dart';

class GetWatchlistTv {
  final TvRepository _repository;

  GetWatchlistTv(this._repository);

  Future<Either<Failure, List<Tv>>> execute() {
    return _repository.getWatchlistTv();
  }
}
