import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../tv_helper/page_test_helper.dart';

void main() {
  late FakeTvNowPlayingBloc fakeTvNowPlayingBloc;
  late FakeTvPopularBloc fakeTvPopularBloc;
  late FakeTvTopRatedBloc fakeTvTopRatedBloc;

  setUp(() {
    fakeTvNowPlayingBloc = FakeTvNowPlayingBloc();
    registerFallbackValue(FakeTvNowPlayingEvent());
    registerFallbackValue(FakeTvNowPlayingState());

    fakeTvPopularBloc = FakeTvPopularBloc();
    registerFallbackValue(FakeTvPopularEvent());
    registerFallbackValue(FakeTvPopularState());

    fakeTvTopRatedBloc = FakeTvTopRatedBloc();
    registerFallbackValue(FakeTvTopRatedEvent());
    registerFallbackValue(FakeTvTopRatedState());

    TestWidgetsFlutterBinding.ensureInitialized();
  });

  tearDown(() {
    fakeTvNowPlayingBloc.close();
    fakeTvPopularBloc.close();
    fakeTvTopRatedBloc.close();
  });

  Widget _createTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvNowPlayingBloc>(
          create: (context) => fakeTvNowPlayingBloc,
        ),
        BlocProvider<TvPopularBloc>(
          create: (context) => fakeTvPopularBloc,
        ),
        BlocProvider<TvTopRatedBloc>(
          create: (context) => fakeTvTopRatedBloc,
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets('Page should display circular progress indicator when loading',
          (WidgetTester tester) async {
        when(() => fakeTvNowPlayingBloc.state)
            .thenReturn(TvNowPlayingLoading());
        when(() => fakeTvPopularBloc.state)
            .thenReturn(TvPopularLoading());
        when(() => fakeTvTopRatedBloc.state)
            .thenReturn(TvTopRatedLoading());

        final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

        await tester.pumpWidget(_createTestableWidget(const HomeTvPage()));

        expect(circularProgressIndicatorFinder, findsNWidgets(3));
      });

  testWidgets(
      'Page should display listview of TvNowPlaying when HasData state is happen',
          (WidgetTester tester) async {
        when(() => fakeTvNowPlayingBloc.state)
            .thenReturn(TvNowPlayingHasData(testTvSeriesList));
        when(() => fakeTvPopularBloc.state)
            .thenReturn(TvPopularHasData(testTvSeriesList));
        when(() => fakeTvTopRatedBloc.state)
            .thenReturn(TvTopRatedHasData(testTvSeriesList));

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(_createTestableWidget(const HomeTvPage()));

        expect(listViewFinder, findsWidgets);
      });

  testWidgets('Page should display error with text when Error state is happen',
          (WidgetTester tester) async {
        when(() => fakeTvNowPlayingBloc.state)
            .thenReturn(TvNowPlayingError('error'));
        when(() => fakeTvPopularBloc.state)
            .thenReturn(TvPopularError('error'));
        when(() => fakeTvTopRatedBloc.state)
            .thenReturn(TvTopRatedError('error'));

        final errorKeyFinder = find.byKey(const Key('error_msg'));

        await tester.pumpWidget(_createTestableWidget(const HomeTvPage()));
        expect(errorKeyFinder, findsNWidgets(3));
      });

  testWidgets('Page should not display when Empty state is happen',
          (WidgetTester tester) async {
        when(() => fakeTvNowPlayingBloc.state)
            .thenReturn(TvNowPlayingEmpty());
        when(() => fakeTvPopularBloc.state)
            .thenReturn(TvPopularEmpty());
        when(() => fakeTvTopRatedBloc.state)
            .thenReturn(TvTopRatedEmpty());

        final containerFinder = find.byType(Container);

        await tester.pumpWidget(_createTestableWidget(const HomeTvPage()));
        expect(containerFinder, findsNWidgets(3));
      });
}
