import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/movie.dart';
import 'package:watchlist/watchlist.dart';

// fake now playing movies bloc
class FakeMovieNowPlayingEvent extends Fake implements MovieNowPlayingEvent {}

class FakeMovieNowPlayingState extends Fake implements MovieNowPlayingState {}

class FakeMovieNowPlayingBloc
    extends MockBloc<MovieNowPlayingEvent, MovieNowPlayingState>
    implements MovieNowPlayingBloc {}

// fake popular movies bloc
class FakeMoviePopularEvent extends Fake implements MoviePopularEvent {}

class FakeMoviePopularState extends Fake implements MoviePopularState {}

class FakeMoviePopularBloc
    extends MockBloc<MoviePopularEvent, MoviePopularState>
    implements MoviePopularBloc {}

// fake top rated movies bloc
class FakeMovieTopRatedEvent extends Fake implements MovieTopRatedEvent {}

class FakeMovieTopRatedState extends Fake implements MovieTopRatedState {}

class FakeMovieTopRatedBloc
    extends MockBloc<MovieTopRatedEvent, MovieTopRatedState>
    implements MovieTopRatedBloc {}

// fake detail movie bloc
class FakeMovieDetailEvent extends Fake implements MovieDetailEvent {}

class FakeMovieDetailState extends Fake implements MovieDetailState {}

class FakeMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState>
    implements MovieDetailBloc {}

// fake movie recommendations bloc
class FakeMovieRecommendationsEvent extends Fake
    implements MovieRecommendationEvent {}

class FakeMovieRecommendationsState extends Fake
    implements MovieRecommendationState {}

class FakeMovieRecommendationsBloc
    extends MockBloc<MovieRecommendationEvent, MovieRecommendationState>
    implements MovieRecommendationBloc {}

// fake watchlist movies bloc
class FakeMovieWatchlistEvent extends Fake implements MoviesWatchlistEvent {}

class FakeMovieWatchlistState extends Fake implements MoviesWatchlistState {}

class FakeMovieWatchlistBloc
    extends MockBloc<MoviesWatchlistEvent, MoviesWatchlistState>
    implements MoviesWatchlistBloc {}
