import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:movie/presentation/bloc/movie_top_rated/movie_top_rated_bloc.dart';
import 'package:watchlist/presentation/bloc/movie/movie_watchlist_bloc.dart';

// fake now playing movies bloc
class FakeNowPlayingMoviesEvent extends Fake implements MovieNowPlayingEvent {}

class FakeNowPlayingMoviesState extends Fake implements MovieNowPlayingState {}

class FakeNowPlayingMoviesBloc
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
class FakeMovieRecommendationEvent extends Fake
    implements MovieRecommendationEvent {}

class FakeMovieRecommendationState extends Fake
    implements MovieRecommendationState {}

class FakeMovieRecommendationBloc
    extends MockBloc<MovieRecommendationEvent, MovieRecommendationState>
    implements MovieRecommendationBloc {}

// fake watchlist movies bloc
class FakeMovieWatchlistEvent extends Fake implements MoviesWatchlistEvent {}

class FakeMoviesWatchlistState extends Fake implements MoviesWatchlistState {}

class FakeMoviesWatchlistBloc
    extends MockBloc<MoviesWatchlistEvent, MoviesWatchlistState>
    implements MoviesWatchlistBloc {}
