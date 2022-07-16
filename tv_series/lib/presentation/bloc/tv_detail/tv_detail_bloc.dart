import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_detail_event.dart';
part 'tv_detail_state.dart';

class TvDetailBloc
    extends Bloc<TvDetailEvent, TvDetailState> {
  final GetDetailTv _getTvDetail;
  TvDetailBloc(this._getTvDetail) : super(TvDetailEmpty()) {
    on<OnTvDetailCalled>((event, emit) async {
      final id = event.id;

      emit(TvDetailLoading());

      final result = await _getTvDetail.execute(id);

      result.fold((failure) => emit(TvDetailError(failure.message)),
              (data) => emit(TvDetailHasData(data)));
    });
  }
}
