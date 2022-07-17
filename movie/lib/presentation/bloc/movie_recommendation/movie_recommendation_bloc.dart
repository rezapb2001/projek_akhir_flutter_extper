import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';

part 'movie_recommendation_event.dart';
part 'movie_recommendation_state.dart';

class MovieRecommendationBloc
    extends Bloc<MovieRecommendationEvent, MovieRecommendationState> {
  final GetMovieRecommendations _getMovieRecommendation;
  MovieRecommendationBloc(this._getMovieRecommendation)
      : super(MovieRecommendationEmpty()) {
    on<OnMovieRecommendationCalled>((event, emit) async {
      final id = event.id;

      emit(MovieRecommendationLoading());

      final result = await _getMovieRecommendation.execute(id);

      result.fold(
            (failure) => emit(MovieRecommendationError(failure.message)),
            (data) => data.isNotEmpty
            ? emit(MovieRecommendationHasData(data))
            : emit(MovieRecommendationEmpty()),
      );
    });
  }
}
