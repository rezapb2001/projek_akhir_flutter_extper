import 'package:core/core.dart';
import 'package:tv_series/tv_series.dart';

import 'package:dartz/dartz.dart';

class GetNowPlayingTv {
  final TvRepository repository;

  GetNowPlayingTv(this.repository);

  Future<Either<Failure, List<Tv>>> execute() {
      return repository.getNowPlaying();
  }
}
