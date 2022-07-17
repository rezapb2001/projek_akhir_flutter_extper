import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:watchlist/watchlist.dart';

import '../../watchlisthelper/page_test_helper.dart';

void main() {
  late FakeWatchlistTvBloc fakeWatchlistTvSeriesBloc;

  setUpAll(() {
    fakeWatchlistTvSeriesBloc = FakeWatchlistTvBloc();
    registerFallbackValue(FakeWatchlistTvEvent());
    registerFallbackValue(FakeWatchlistTvState());
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TvWatchlistBloc>(
      create: (_) => fakeWatchlistTvSeriesBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  tearDown(() => fakeWatchlistTvSeriesBloc.close());

  testWidgets('page should display circular progress indicator when loading',
          (WidgetTester tester) async {
        when(() => fakeWatchlistTvSeriesBloc.state)
            .thenReturn(TvWatchlistLoading());

        final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

        await tester.pumpWidget(_makeTestableWidget(const WatchlistTvPage()));
        await tester.pump();

        expect(circularProgressIndicatorFinder, findsOneWidget);
      });

  testWidgets('should display text with message when error',
          (WidgetTester tester) async {
        const errorMessage = 'error message';

        when(() => fakeWatchlistTvSeriesBloc.state)
            .thenReturn(TvWatchlistError(errorMessage));

        final textMessageKeyFinder = find.byKey(const Key('error_message'));
        await tester.pumpWidget(_makeTestableWidget(const WatchlistTvPage()));
        await tester.pump();

        expect(textMessageKeyFinder, findsOneWidget);
      });
}
