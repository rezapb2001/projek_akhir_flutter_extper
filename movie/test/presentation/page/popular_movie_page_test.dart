import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/movie.dart';

import '../../movie_helper/page_helper_test.dart';

void main() {
  late FakeMoviePopularBloc fakeMoviePopularBloc;

  setUpAll(() {
    fakeMoviePopularBloc = FakeMoviePopularBloc();
    registerFallbackValue(FakeMoviePopularEvent());
    registerFallbackValue(FakeMoviePopularState());
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<MoviePopularBloc>(
      create: (_) => fakeMoviePopularBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  tearDown(() {
    fakeMoviePopularBloc.close();
  });

  testWidgets('page should display circular progress indicator when loading',
          (WidgetTester tester) async {
        when(() => fakeMoviePopularBloc.state).thenReturn(MoviePopularLoading());

        final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

        await tester.pumpWidget(_makeTestableWidget(const PopularMoviesPage()));
        await tester.pump();

        expect(circularProgressIndicatorFinder, findsOneWidget);
      });

  testWidgets('should display text with message when error',
          (WidgetTester tester) async {
        const errorMessage = 'error message';

        when(() => fakeMoviePopularBloc.state)
            .thenReturn(MoviePopularError(errorMessage));

        final textMessageKeyFinder = find.byKey(const Key('error_msg'));
        await tester.pumpWidget(_makeTestableWidget(const PopularMoviesPage()));
        await tester.pump();

        expect(textMessageKeyFinder, findsOneWidget);
      });
}
