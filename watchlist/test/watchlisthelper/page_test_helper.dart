import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:watchlist/watchlist.dart';

// fake Movie watchlist
class FakeMovieWatchlistEvent extends Fake implements MoviesWatchlistEvent {}

class FakeMovieWatchlistState extends Fake implements MoviesWatchlistState {}

class FakeWatchlistMovieBloc
    extends MockBloc<MoviesWatchlistEvent, MoviesWatchlistState>
    implements MoviesWatchlistBloc {}


// fake Tv watchlist
class FakeWatchlistTvEvent extends Fake
    implements TvWatchlistEvent {}

class FakeWatchlistTvState extends Fake
    implements TvWatchlistState {}

class FakeWatchlistTvBloc
    extends MockBloc<TvWatchlistEvent, TvWatchlistState>
    implements TvWatchlistBloc {}
