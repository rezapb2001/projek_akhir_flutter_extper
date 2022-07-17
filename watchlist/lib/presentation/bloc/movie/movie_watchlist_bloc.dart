import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/movie.dart';
import 'package:watchlist/watchlist.dart';

part 'movie_watchlist_event.dart';
part 'movie_watchlist_state.dart';

class MoviesWatchlistBloc
    extends Bloc<MoviesWatchlistEvent, MoviesWatchlistState> {
  final GetWatchlistMovies _getWatchlistMovies;
  final GetWatchListStatus _getWatchListStatusMovies;
  final RemoveWatchlist _removeWatchlistMovies;
  final SaveWatchlist _saveWatchlistMovies;
  MoviesWatchlistBloc(
      this._getWatchlistMovies,
      this._getWatchListStatusMovies,
      this._removeWatchlistMovies,
      this._saveWatchlistMovies,
      ) : super(MoviesWatchlistEmpty()) {
    on<OnMoviesWatchlistCalled>((event, emit) async {
      emit(MoviesWatchlistLoading());
      final result = await _getWatchlistMovies.execute();

      result.fold(
              (failure) => emit(MoviesWatchlistError(failure.message)),
              (data) => data.isNotEmpty
              ? emit(MoviesWatchlistHasData(data))
              : emit(
                MoviesWatchlistEmpty(),
          ));
    });

    on<FetchMovieWatchlistStatus>(((event, emit) async {
      final id = event.id;

      final result = await _getWatchListStatusMovies.execute(id);

      emit(MoviesWatchlistIsAdded(result));
    }));

    on<AddMovieToWatchlist>(
      ((event, emit) async {
        final movie = event.movieDetail;

        final result = await _saveWatchlistMovies.execute(movie);

        result.fold(
              (failure) => emit(MoviesWatchlistError(failure.message)),
              (message) => emit(
                MoviesWatchlistMessage(message),
          ),
        );
      }),
    );

    on<RemoveMovieFromWatchlist>(
      ((event, emit) async {
        final movie = event.movieDetail;

        final result = await _removeWatchlistMovies.execute(movie);

        result.fold(
              (failure) => emit(MoviesWatchlistError(failure.message)),
              (message) => emit(
                MoviesWatchlistMessage(message),
          ),
        );
      }),
    );
  }
}
