import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:tv_series/tv_series.dart';
import 'package:watchlist/watchlist.dart';

// fake Tv now playing   bloc
class FakeTvNowPlayingEvent extends Fake
    implements TvNowPlayingEvent {}

class FakeTvNowPlayingState extends Fake
    implements TvNowPlayingState {}

class FakeTvNowPlayingBloc
    extends MockBloc<TvNowPlayingEvent, TvNowPlayingState>
    implements TvNowPlayingBloc {}

// fake Tv popular  bloc
class FakeTvPopularEvent extends Fake implements TvPopularEvent {}

class FakeTvPopularState extends Fake implements TvPopularState {}

class FakeTvPopularBloc
    extends MockBloc<TvPopularEvent, TvPopularState>
    implements TvPopularBloc {}

// fake Tv top rated  bloc
class FakeTvTopRatedEvent extends Fake implements TvTopRatedEvent {}

class FakeTvTopRatedState extends Fake implements TvTopRatedState {}

class FakeTvTopRatedBloc
    extends MockBloc<TvTopRatedEvent, TvTopRatedState>
    implements TvTopRatedBloc {}

// fake Tv detail  bloc
class FakeTvDetailEvent extends Fake implements TvDetailEvent {}

class FakeTvDetailState extends Fake implements TvDetailState {}

class FakeTvDetailBloc
    extends MockBloc<TvDetailEvent, TvDetailState>
    implements TvDetailBloc {}

// fake Tv recommendations bloc
class FakeTvRecommendationEvent extends Fake
    implements TvRecommendationEvent {}

class FakeTvRecommendationState extends Fake
    implements TvRecommendationState {}

class FakeTvRecommendationBloc
    extends MockBloc<TvRecommendationEvent, TvRecommendationState>
    implements TvRecommendationBloc {}

// fake Tv watchlist  bloc
class FakeTvWatchlistEvent extends Fake
    implements TvWatchlistEvent {}

class FakeTvWatchlistState extends Fake
    implements TvWatchlistState {}

class FakeTvWatchlistBloc
    extends MockBloc<TvWatchlistEvent, TvWatchlistState>
    implements TvWatchlistBloc {}
