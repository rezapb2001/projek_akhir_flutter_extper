import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  final GetPopularMovies _getMoviePopulars;
  MoviePopularBloc(this._getMoviePopulars) : super(MoviePopularEmpty()) {
    on<OnMoviePopularCalled>((event, emit) async {
      emit(MoviePopularLoading());

      final result = await _getMoviePopulars.execute();

      result.fold(
            (failure) => emit(MoviePopularError(failure.message)),
            (data) => data.isNotEmpty
            ? emit(MoviePopularHasData(data))
            : emit(MoviePopularEmpty()),
      );
    });
  }
}
