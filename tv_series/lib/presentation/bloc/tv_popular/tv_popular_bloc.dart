import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_popular_event.dart';
part 'tv_popular_state.dart';

class TvPopularBloc
    extends Bloc<TvPopularEvent, TvPopularState> {
  final GetPopularTv _getPopularTvSeries;
  TvPopularBloc(this._getPopularTvSeries)
      : super(TvPopularEmpty()) {
    on<OnTvPopularCalled>((event, emit) async {
      emit(TvPopularLoading());

      final result = await _getPopularTvSeries.execute();

      result.fold(
            (failure) => emit(TvPopularError(failure.message)),
            (data) => data.isNotEmpty
            ? emit(TvPopularHasData(data))
            : emit(TvPopularEmpty()),
      );
    });
  }
}
