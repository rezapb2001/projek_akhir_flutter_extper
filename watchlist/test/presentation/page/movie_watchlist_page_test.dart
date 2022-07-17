import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:watchlist/watchlist.dart';

import '../../watchlisthelper/page_test_helper.dart';

void main() {
  late FakeWatchlistMovieBloc fakeWatchlistMoviesBloc;

  setUpAll(() {
    fakeWatchlistMoviesBloc = FakeWatchlistMovieBloc();
    registerFallbackValue(FakeMovieWatchlistEvent());
    registerFallbackValue(FakeMovieWatchlistState());
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<MoviesWatchlistBloc>(
      create: (_) => fakeWatchlistMoviesBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  tearDown(() => fakeWatchlistMoviesBloc.close());

  testWidgets('page should display circular progress indicator when loading',
          (WidgetTester tester) async {
        when(() => fakeWatchlistMoviesBloc.state)
            .thenReturn(MoviesWatchlistLoading());

        final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

        await tester.pumpWidget(_makeTestableWidget(const WatchlistMoviesPage()));
        await tester.pump();

        expect(circularProgressIndicatorFinder, findsOneWidget);
      });

  testWidgets('should display text with message when error',
          (WidgetTester tester) async {
        const errorMessage = 'error message';

        when(() => fakeWatchlistMoviesBloc.state)
            .thenReturn(MoviesWatchlistError(errorMessage));

        final textMessageKeyFinder = find.byKey(const Key('error_message'));
        await tester.pumpWidget(_makeTestableWidget(const WatchlistMoviesPage()));
        await tester.pump();

        expect(textMessageKeyFinder, findsOneWidget);
      });
}
