import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';

part 'movie_now_playing_event.dart';
part 'movie_now_playing_state.dart';

class MovieNowPlayingBloc
    extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  final GetNowPlayingMovies getMovieNowPlayings;

  MovieNowPlayingBloc(this.getMovieNowPlayings)
      : super(MovieNowPlayingEmpty()) {
    on<OnMovieNowPlayingCalled>((event, emit) async {
      emit(MovieNowPlayingLoading());
      final result = await getMovieNowPlayings.execute();

      result.fold((failure) {
        emit(MovieNowPlayingError(failure.message));
      }, (data) {
        data.isEmpty
            ? emit(MovieNowPlayingEmpty())
            : emit(MovieNowPlayingHasData(data));
      });
    });
  }
}
