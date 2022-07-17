import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/movie.dart';

import '../../movie_helper/page_helper_test.dart';

void main() {
  late FakeMovieTopRatedBloc fakeMovieTopRatedBloc;

  setUpAll(() {
    fakeMovieTopRatedBloc = FakeMovieTopRatedBloc();
    registerFallbackValue(FakeMovieTopRatedEvent());
    registerFallbackValue(FakeMovieTopRatedState());
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<MovieTopRatedBloc>(
      create: (_) => fakeMovieTopRatedBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  tearDown(() => fakeMovieTopRatedBloc.close());

  testWidgets('page should display circular progress indicator when loading',
          (WidgetTester tester) async {
        when(() => fakeMovieTopRatedBloc.state)
            .thenReturn(MovieTopRatedLoading());

        final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

        await tester.pumpWidget(_makeTestableWidget(const TopRatedMoviesPage()));
        await tester.pump();

        expect(circularProgressIndicatorFinder, findsOneWidget);
      });

  testWidgets('should display text with message when error',
          (WidgetTester tester) async {
        const errorMessage = 'error message';

        when(() => fakeMovieTopRatedBloc.state)
            .thenReturn(MovieTopRatedError(errorMessage));

        final textMessageKeyFinder = find.byKey(const Key('error_msg'));
        await tester.pumpWidget(_makeTestableWidget(const TopRatedMoviesPage()));
        await tester.pump();

        expect(textMessageKeyFinder, findsOneWidget);
      });
}
