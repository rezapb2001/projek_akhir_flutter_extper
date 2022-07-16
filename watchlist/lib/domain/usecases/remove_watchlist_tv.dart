import 'package:core/core.dart';
import 'package:tv_series/tv_series.dart';

import 'package:dartz/dartz.dart';


class RemoveWatchlistTv {
  final TvRepository repository;

  RemoveWatchlistTv(this.repository);

  Future<Either<Failure, String>> execute(TvDetail tv) {
    return repository.removeWatchlistTv(tv);
  }
}
