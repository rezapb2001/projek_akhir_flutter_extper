import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../movie_helper/page_helper_test.dart';

void main() {
  late FakeMovieNowPlayingBloc fakeMovieNowPlayingBloc;
  late FakeMoviePopularBloc fakeMoviePopularBloc;
  late FakeMovieTopRatedBloc fakeMovieTopRatedBloc;

  setUp(() {
    fakeMovieNowPlayingBloc = FakeMovieNowPlayingBloc();
    registerFallbackValue(FakeMovieNowPlayingEvent());
    registerFallbackValue(FakeMovieNowPlayingState());

    fakeMoviePopularBloc = FakeMoviePopularBloc();
    registerFallbackValue(FakeMoviePopularEvent());
    registerFallbackValue(FakeMoviePopularState());

    fakeMovieTopRatedBloc = FakeMovieTopRatedBloc();
    registerFallbackValue(FakeMovieTopRatedEvent());
    registerFallbackValue(FakeMovieTopRatedState());

    TestWidgetsFlutterBinding.ensureInitialized();
  });

  tearDown(() {
    fakeMovieNowPlayingBloc.close();
    fakeMoviePopularBloc.close();
    fakeMovieTopRatedBloc.close();
  });

  Widget _createTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieNowPlayingBloc>(
          create: (context) => fakeMovieNowPlayingBloc,
        ),
        BlocProvider<MoviePopularBloc>(
          create: (context) => fakeMoviePopularBloc,
        ),
        BlocProvider<MovieTopRatedBloc>(
          create: (context) => fakeMovieTopRatedBloc,
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets(
      'page should display listview of MovieNowPlaying when HasData state is happen',
          (WidgetTester tester) async {
        when(() => fakeMovieNowPlayingBloc.state)
            .thenReturn(MovieNowPlayingHasData(testMovieList));
        when(() => fakeMoviePopularBloc.state)
            .thenReturn(MoviePopularHasData(testMovieList));
        when(() => fakeMovieTopRatedBloc.state)
            .thenReturn(MovieTopRatedHasData(testMovieList));

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(_createTestableWidget(const HomeMoviePage()));

        expect(listViewFinder, findsWidgets);
      });
}
