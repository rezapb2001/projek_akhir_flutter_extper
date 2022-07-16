import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_now_playing_event.dart';
part 'tv_now_playing_state.dart';

class TvNowPlayingBloc
    extends Bloc<TvNowPlayingEvent, TvNowPlayingState> {
  final GetNowPlayingTv _getNowPlaying;
  TvNowPlayingBloc(this._getNowPlaying)
      : super(TvNowPlayingEmpty()) {
    on<TvNowPlaying>((event, emit) async {
      emit(TvNowPlayingLoading());

      final result = await _getNowPlaying.execute();

      result.fold((failure) {
        emit(TvNowPlayingError(failure.message));
      }, (data) {
        data.isNotEmpty
            ? emit(TvNowPlayingHasData(data))
            : emit(TvNowPlayingEmpty());
      });
    });
  }
}
