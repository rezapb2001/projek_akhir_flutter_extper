part of 'tv_watchlist_bloc.dart';

abstract class TvWatchlistEvent extends Equatable {}

class OnTvWatchlistCalled extends TvWatchlistEvent {
  @override
  List<Object?> get props => [];
}

class FetchTvWatchlistStatus extends TvWatchlistEvent {
  final int id;
  FetchTvWatchlistStatus(this.id);
  @override
  List<Object?> get props => [id];
}

class AddTvToWatchlist extends TvWatchlistEvent {
  final TvDetail tv;
  AddTvToWatchlist(this.tv);
  @override
  List<Object?> get props => [tv];
}

class RemoveTvFromWatchlist extends TvWatchlistEvent {
  final TvDetail tv;
  RemoveTvFromWatchlist(this.tv);
  @override
  List<Object?> get props => [tv];
}
