part of 'movie_watchlist_bloc.dart';

abstract class MoviesWatchlistEvent extends Equatable {}

class OnMoviesWatchlistCalled extends MoviesWatchlistEvent {
  @override
  List<Object?> get props => [];
}

class FetchMovieWatchlistStatus extends MoviesWatchlistEvent {
  final int id;
  FetchMovieWatchlistStatus(this.id);
  @override
  List<Object?> get props => [id];
}

class AddMovieToWatchlist extends MoviesWatchlistEvent {
  final MovieDetail movieDetail;
  AddMovieToWatchlist(this.movieDetail);
  @override
  List<Object?> get props => [movieDetail];
}

class RemoveMovieFromWatchlist extends MoviesWatchlistEvent {
  final MovieDetail movieDetail;
  RemoveMovieFromWatchlist(this.movieDetail);
  @override
  List<Object?> get props => [movieDetail];
}
