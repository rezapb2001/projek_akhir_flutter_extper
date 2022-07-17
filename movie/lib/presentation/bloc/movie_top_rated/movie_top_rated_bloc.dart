import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';

part 'movie_top_rated_event.dart';
part 'movie_top_rated_state.dart';

class MovieTopRatedBloc
    extends Bloc<MovieTopRatedEvent, MovieTopRatedState> {
  final GetTopRatedMovies _getMovieTopRated;
  MovieTopRatedBloc(this._getMovieTopRated) : super(MovieTopRatedEmpty()) {
    on<OnMovieTopRatedCalled>((event, emit) async {
      emit(MovieTopRatedLoading());
      final result = await _getMovieTopRated.execute();

      result.fold(
            (failure) => emit(MovieTopRatedError(failure.message)),
            (data) => data.isNotEmpty
            ? emit(MovieTopRatedHasData(data))
            : emit(
          MovieTopRatedEmpty(),
        ),
      );
    });
  }
}
