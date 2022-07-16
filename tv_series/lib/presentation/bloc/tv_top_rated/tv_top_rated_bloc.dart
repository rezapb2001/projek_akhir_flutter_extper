import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_top_rated_event.dart';
part 'tv_top_rated_state.dart';

class TvTopRatedBloc
    extends Bloc<TvTopRatedEvent, TvTopRatedState> {
  final GetTopRatedTv _getTopRated;
  TvTopRatedBloc(this._getTopRated)
      : super(TvTopRatedEmpty()) {
    on<OnTvTopRatedCalled>((event, emit) async {
      emit(TvTopRatedLoading());
      final result = await _getTopRated.execute();

      result.fold(
            (failure) => emit(TvTopRatedError(failure.message)),
            (data) => data.isNotEmpty
            ? emit(TvTopRatedHasData(data))
            : emit(TvTopRatedEmpty()),
      );
    });
  }
}
