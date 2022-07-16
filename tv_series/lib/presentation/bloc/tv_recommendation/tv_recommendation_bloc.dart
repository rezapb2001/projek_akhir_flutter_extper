import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_recommendation_event.dart';
part 'tv_recommendation_state.dart';

class TvRecommendationBloc
    extends Bloc<TvRecommendationEvent, TvRecommendationState> {
  final GetRecommendationTv _getTvRecommendation;
  TvRecommendationBloc(this._getTvRecommendation)
      : super(TvRecommendationEmpty()) {
    on<OnTvRecommendationCalled>((event, emit) async {
      final id = event.id;

      emit(TvRecommendationLoading());

      final result = await _getTvRecommendation.execute(id);

      result.fold(
            (failure) => emit(TvRecommendationError(failure.message)),
            (data) => data.isNotEmpty
            ? emit(TvRecommendationHasData(data))
            : emit(TvRecommendationEmpty()),
      );
    });
  }
}
