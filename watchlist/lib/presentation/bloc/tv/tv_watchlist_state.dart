part of 'tv_watchlist_bloc.dart';

abstract class TvWatchlistState extends Equatable {}

class TvWatchlistEmpty extends TvWatchlistState {
  @override
  List<Object?> get props => [];
}

class TvWatchlistLoading extends TvWatchlistState {
  @override
  List<Object?> get props => [];
}

class TvWatchlistError extends TvWatchlistState {
  final String message;
  TvWatchlistError(this.message);
  @override
  List<Object?> get props => [message];
}

class TvWatchlistHasData extends TvWatchlistState {
  final List<Tv> result;
  TvWatchlistHasData(this.result);
  @override
  List<Object?> get props => [result];
}

class TvWatchlistIsAdded extends TvWatchlistState {
  final bool isAdded;
  TvWatchlistIsAdded(this.isAdded);
  @override
  List<Object?> get props => [isAdded];
}

class TvWatchlistMessage extends TvWatchlistState {
  final String message;

  TvWatchlistMessage(this.message);
  @override
  List<Object?> get props => [message];
}
