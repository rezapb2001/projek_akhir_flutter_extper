part of 'tv_now_playing_bloc.dart';

abstract class TvNowPlayingState extends Equatable {}

class TvNowPlayingEmpty extends TvNowPlayingState {
  @override
  List<Object> get props => [];
}

class TvNowPlayingLoading extends TvNowPlayingState {
  @override
  List<Object> get props => [];
}

class TvNowPlayingError extends TvNowPlayingState {
  final String message;
  TvNowPlayingError(this.message);

  @override
  List<Object> get props => [message];
}

class TvNowPlayingHasData extends TvNowPlayingState {
  final List<Tv> result;
  TvNowPlayingHasData(this.result);

  @override
  List<Object> get props => [result];
}
