part of 'movie_watchlist_bloc.dart';


abstract class MoviesWatchlistState extends Equatable {}

class MoviesWatchlistEmpty extends MoviesWatchlistState {
  @override
  List<Object?> get props => [];
}

class MoviesWatchlistLoading extends MoviesWatchlistState {
  @override
  List<Object?> get props => [];
}

class MoviesWatchlistError extends MoviesWatchlistState {
  final String message;
  MoviesWatchlistError(this.message);
  @override
  List<Object?> get props => [message];
}

class MoviesWatchlistHasData extends MoviesWatchlistState {
  final List<Movie> result;
  MoviesWatchlistHasData(this.result);
  @override
  List<Object?> get props => [result];
}

class MoviesWatchlistIsAdded extends MoviesWatchlistState {
  final bool isAdded;
  MoviesWatchlistIsAdded(this.isAdded);
  @override
  List<Object?> get props => [isAdded];
}

class MoviesWatchlistMessage extends MoviesWatchlistState {
  final String message;

  MoviesWatchlistMessage(this.message);
  @override
  List<Object?> get props => [message];
}
