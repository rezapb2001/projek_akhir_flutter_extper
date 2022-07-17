import 'package:about/about.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';
import 'package:tv/tv.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ditonton/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HttpSSLPinning.init();

  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Movie provider
        BlocProvider(
          create: (_) => di.locator<NowPlayingMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<RecommendationMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchMoviesBloc>(),
        ),

        // Tv Series provider
        BlocProvider(
          create: (_) => di.locator<TvOnTheAirBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTvShowsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTvShowsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvRecommendationsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSearchBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'DiTonTon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: SplashScreen(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/splashscreen':
              return MaterialPageRoute(builder: (_) => SplashScreen());
            case ScreenLogin.routeName:
              return MaterialPageRoute(builder: (_) => ScreenLogin());
            case '/home':
              return MaterialPageRoute(builder: (_) => HomePage());
            case SearchPage.routeName:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistPage.routeName:
              return MaterialPageRoute(builder: (_) => WatchlistPage());
            case HomeMoviePage.routeName:
              return CupertinoPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.routeName:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.routeName:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchMoviePage.routeName:
              return CupertinoPageRoute(builder: (_) => SearchMoviePage());
            case WatchlistMoviesPage.routeName:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case HomeTvPage.routeName:
              return CupertinoPageRoute(builder: (_) => HomeTvPage());
            case PopularTvPage.routeName:
              return CupertinoPageRoute(builder: (_) => PopularTvPage());
            case TopRatedTvPage.routeName:
              return CupertinoPageRoute(builder: (_) => TopRatedTvPage());
            case SearchTvPage.routeName:
              return CupertinoPageRoute(builder: (_) => SearchTvPage());
            case TvDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvDetailPage(id: id),
                settings: settings,
              );
            case WatchlistTvPage.routeName:
              return MaterialPageRoute(builder: (_) => WatchlistTvPage());
            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
