import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/movie.dart';
import 'package:watchlist/watchlist.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../movie_helper/page_helper_test.dart';

void main() {
  late FakeMovieDetailBloc fakeMovieDetailBloc;
  late FakeMovieWatchlistBloc fakeMovieWatchlistBloc;
  late FakeMovieRecommendationsBloc fakeMovieRecommendationBloc;

  setUpAll(() {
    fakeMovieDetailBloc = FakeMovieDetailBloc();
    registerFallbackValue(FakeMovieDetailEvent());
    registerFallbackValue(FakeMovieDetailState());

    fakeMovieWatchlistBloc = FakeMovieWatchlistBloc();
    registerFallbackValue(FakeMovieWatchlistEvent());
    registerFallbackValue(FakeMovieWatchlistState());

    fakeMovieRecommendationBloc = FakeMovieRecommendationsBloc();
    registerFallbackValue(FakeMovieRecommendationsEvent());
    registerFallbackValue(FakeMovieRecommendationsState());
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailBloc>(
          create: (_) => fakeMovieDetailBloc,
        ),
        BlocProvider<MoviesWatchlistBloc>(
          create: (_) => fakeMovieWatchlistBloc,
        ),
        BlocProvider<MovieRecommendationBloc>(
          create: (_) => fakeMovieRecommendationBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  tearDown(() {
    fakeMovieDetailBloc.close();
    fakeMovieWatchlistBloc.close();
    fakeMovieRecommendationBloc.close();
  });

  const testId = 1;

  testWidgets('page should display circular progress indicator when loading',
          (WidgetTester tester) async {
        when(() => fakeMovieDetailBloc.state).thenReturn(MovieDetailLoading());
        when(() => fakeMovieWatchlistBloc.state)
            .thenReturn(MoviesWatchlistLoading());
        when(() => fakeMovieRecommendationBloc.state)
            .thenReturn(MovieRecommendationLoading());

        final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

        await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(
          id: testId,
        )));
        await tester.pump();

        expect(circularProgressIndicatorFinder, findsOneWidget);
      });

  testWidgets('should widget display which all required',
          (WidgetTester tester) async {
        when(() => fakeMovieDetailBloc.state)
            .thenReturn(MovieDetailHasData(testMovieDetail));
        when(() => fakeMovieWatchlistBloc.state)
            .thenReturn(MoviesWatchlistHasData(testMovieList));
        when(() => fakeMovieRecommendationBloc.state)
            .thenReturn(MovieRecommendationHasData(testMovieList));
        await tester
            .pumpWidget(_makeTestableWidget(const MovieDetailPage(id: testId)));
        await tester.pump();

        expect(find.text('Watchlist'), findsOneWidget);
        expect(find.text('Overview'), findsOneWidget);
        expect(find.text('More Like This'), findsOneWidget);
        expect(find.byKey(const Key('detail_movie')), findsOneWidget);
      });

  testWidgets(
      'should display add icon when movie is not added to watchlist in watchlist button',
          (WidgetTester tester) async {
        when(() => fakeMovieDetailBloc.state)
            .thenReturn(MovieDetailHasData(testMovieDetail));
        when(() => fakeMovieWatchlistBloc.state)
            .thenReturn(MoviesWatchlistIsAdded(false));
        when(() => fakeMovieRecommendationBloc.state)
            .thenReturn(MovieRecommendationHasData(testMovieList));
        final addIconFinder = find.byIcon(Icons.add);
        await tester
            .pumpWidget(_makeTestableWidget(const MovieDetailPage(id: testId)));
        await tester.pump();
        expect(addIconFinder, findsOneWidget);
      });

  testWidgets(
      'should display check icon when movie is added to watchlist in watchlist button',
          (WidgetTester tester) async {
        when(() => fakeMovieDetailBloc.state)
            .thenReturn(MovieDetailHasData(testMovieDetail));
        when(() => fakeMovieWatchlistBloc.state)
            .thenReturn(MoviesWatchlistIsAdded(true));
        when(() => fakeMovieRecommendationBloc.state)
            .thenReturn(MovieRecommendationHasData(testMovieList));
        final checkIconFinder = find.byIcon(Icons.check);
        await tester
            .pumpWidget(_makeTestableWidget(const MovieDetailPage(id: testId)));
        await tester.pump();
        expect(checkIconFinder, findsOneWidget);
      });
}
