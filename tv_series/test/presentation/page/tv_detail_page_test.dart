import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/tv_series.dart';
import 'package:watchlist/watchlist.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../tv_helper/page_test_helper.dart';

void main() {
  late FakeTvDetailBloc fakeTvDetailBloc;
  late FakeTvWatchlistBloc fakeTvWatchlistBloc;
  late FakeTvRecommendationBloc fakeTvRecommendationBloc;

  setUpAll(() {
    fakeTvDetailBloc = FakeTvDetailBloc();
    registerFallbackValue(FakeTvDetailEvent());
    registerFallbackValue(FakeTvDetailState());

    fakeTvWatchlistBloc = FakeTvWatchlistBloc();
    registerFallbackValue(FakeTvWatchlistEvent());
    registerFallbackValue(FakeTvWatchlistState());

    fakeTvRecommendationBloc = FakeTvRecommendationBloc();
    registerFallbackValue(FakeTvRecommendationEvent());
    registerFallbackValue(FakeTvRecommendationState());
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvDetailBloc>(
          create: (_) => fakeTvDetailBloc,
        ),
        BlocProvider<TvWatchlistBloc>(
          create: (_) => fakeTvWatchlistBloc,
        ),
        BlocProvider<TvRecommendationBloc>(
          create: (_) => fakeTvRecommendationBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  tearDown(() {
    fakeTvDetailBloc.close();
    fakeTvWatchlistBloc.close();
    fakeTvRecommendationBloc.close();
  });

  const testId = 1;

  testWidgets('Page should display circular progress indicator when loading',
          (WidgetTester tester) async {
        when(() => fakeTvDetailBloc.state)
            .thenReturn(TvDetailLoading());
        when(() => fakeTvWatchlistBloc.state)
            .thenReturn(TvWatchlistLoading());
        when(() => fakeTvRecommendationBloc.state)
            .thenReturn(TvRecommendationLoading());

        final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

        await tester.pumpWidget(_makeTestableWidget(const TvDetailPage(
          id: testId,
        )));
        await tester.pump();

        expect(circularProgressIndicatorFinder, findsOneWidget);
      });

  testWidgets('Should widget display which all required',
          (WidgetTester tester) async {
        when(() => fakeTvDetailBloc.state)
            .thenReturn(TvDetailHasData(testTvSeriesDetail));
        when(() => fakeTvWatchlistBloc.state)
            .thenReturn(TvWatchlistHasData(testTvSeriesList));
        when(() => fakeTvRecommendationBloc.state)
            .thenReturn(TvRecommendationHasData(testTvSeriesList));
        await tester
            .pumpWidget(_makeTestableWidget(const TvDetailPage(id: testId)));
        await tester.pump();

        expect(find.text('Watchlist'), findsOneWidget);
        expect(find.text('Overview'), findsOneWidget);
        expect(find.text('More Like This'), findsOneWidget);
        expect(find.byKey(const Key('detail_tv')), findsOneWidget);
      });

  testWidgets(
      'Should display add icon when Tvseries is not added to watchlist in watchlist button',
          (WidgetTester tester) async {
        when(() => fakeTvDetailBloc.state)
            .thenReturn(TvDetailHasData(testTvSeriesDetail));
        when(() => fakeTvWatchlistBloc.state)
            .thenReturn(TvWatchlistIsAdded(false));
        when(() => fakeTvRecommendationBloc.state)
            .thenReturn(TvRecommendationHasData(testTvSeriesList));
        final addIconFinder = find.byIcon(Icons.add);
        await tester
            .pumpWidget(_makeTestableWidget(const TvDetailPage(id: testId)));
        await tester.pump();
        expect(addIconFinder, findsOneWidget);
      });

  testWidgets(
      'Should display check icon when Tvseries is added to watchlist in watchlist button',
          (WidgetTester tester) async {
        when(() => fakeTvDetailBloc.state)
            .thenReturn(TvDetailHasData(testTvSeriesDetail));
        when(() => fakeTvWatchlistBloc.state)
            .thenReturn(TvWatchlistIsAdded(true));
        when(() => fakeTvRecommendationBloc.state)
            .thenReturn(TvRecommendationHasData(testTvSeriesList));
        final checkIconFinder = find.byIcon(Icons.check);
        await tester
            .pumpWidget(_makeTestableWidget(const TvDetailPage(id: testId)));
        await tester.pump();
        expect(checkIconFinder, findsOneWidget);
      });
}
