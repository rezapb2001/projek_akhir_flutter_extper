import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/tv_series.dart';

import '../../tv_helper/page_test_helper.dart';

void main() {
  late FakeTvTopRatedBloc fakeTvTopRatedBloc;

  setUpAll(() {
    fakeTvTopRatedBloc = FakeTvTopRatedBloc();
    registerFallbackValue(FakeTvTopRatedEvent());
    registerFallbackValue(FakeTvTopRatedState());
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TvTopRatedBloc>(
      create: (_) => fakeTvTopRatedBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  tearDown(() => fakeTvTopRatedBloc.close());

  testWidgets('page should display circular progress indicator when loading',
          (WidgetTester tester) async {
        when(() => fakeTvTopRatedBloc.state)
            .thenReturn(TvTopRatedLoading());

        final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

        await tester.pumpWidget(_makeTestableWidget(const TopRatedTvPage()));
        await tester.pump();

        expect(circularProgressIndicatorFinder, findsOneWidget);
      });

  testWidgets('should display text with message when error',
          (WidgetTester tester) async {
        const errorMessage = 'error message';

        when(() => fakeTvTopRatedBloc.state)
            .thenReturn(TvTopRatedError(errorMessage));

        final textMessageKeyFinder = find.byKey(const Key('error_msg'));
        await tester.pumpWidget(_makeTestableWidget(const TopRatedTvPage()));
        await tester.pump();

        expect(textMessageKeyFinder, findsOneWidget);
      });
}
