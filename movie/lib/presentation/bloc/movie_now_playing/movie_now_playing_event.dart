part of 'movie_now_playing_bloc.dart';

abstract class MovieNowPlayingEvent extends Equatable {}

class OnMovieNowPlayingCalled extends MovieNowPlayingEvent {
  @override
  List<Object> get props => [];
}
