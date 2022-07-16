import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/tv_series.dart';

import '../../tv_helper/page_test_helper.dart';

void main() {
  late FakeTvPopularBloc fakeTvPopularBloc;

  setUpAll(() {
    fakeTvPopularBloc = FakeTvPopularBloc();
    registerFallbackValue(FakeTvPopularEvent());
    registerFallbackValue(FakeTvPopularState());
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TvPopularBloc>(
      create: (_) => fakeTvPopularBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  tearDown(() {
    fakeTvPopularBloc.close();
  });

  testWidgets('Page should display circular progress indicator when loading',
          (WidgetTester tester) async {
        when(() => fakeTvPopularBloc.state)
            .thenReturn(TvPopularLoading());

        final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

        await tester.pumpWidget(_makeTestableWidget(const PopularTvPage()));
        await tester.pump();

        expect(circularProgressIndicatorFinder, findsOneWidget);
      });

  testWidgets('should display text with message when error',
          (WidgetTester tester) async {
        const errorMessage = 'error message';

        when(() => fakeTvPopularBloc.state)
            .thenReturn(TvPopularError(errorMessage));

        final textMessageKeyFinder = find.byKey(const Key('error_msg'));
        await tester.pumpWidget(_makeTestableWidget(const PopularTvPage()));
        await tester.pump();

        expect(textMessageKeyFinder, findsOneWidget);
      });
}
