import 'package:movie/movie.dart';
import 'package:tv_series/tv_series.dart';
import 'package:search/search.dart';
import 'package:watchlist/watchlist.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory<MovieNowPlayingBloc>(
      () => MovieNowPlayingBloc(locator()));
  locator.registerFactory<MoviePopularBloc>(() => MoviePopularBloc(locator()));
  locator
      .registerFactory<MovieTopRatedBloc>(() => MovieTopRatedBloc(locator()));
  locator.registerFactory<MovieDetailBloc>(() => MovieDetailBloc(locator()));
  locator.registerFactory<MovieRecommendationBloc>(
      () => MovieRecommendationBloc(locator()));
  locator.registerFactory(
    () => MovieSearchBloc(
      locator(),
    ),
  );
  locator.registerFactory<MoviesWatchlistBloc>(
      () => MoviesWatchlistBloc(locator(), locator(), locator(), locator()));

  // provider TV
  locator.registerFactory<TvNowPlayingBloc>(() => TvNowPlayingBloc(locator()));
  locator.registerFactory<TvPopularBloc>(() => TvPopularBloc(locator()));
  locator.registerFactory<TvTopRatedBloc>(() => TvTopRatedBloc(locator()));
  locator.registerFactory<TvDetailBloc>(() => TvDetailBloc(locator()));
  locator.registerFactory<TvRecommendationBloc>(
      () => TvRecommendationBloc(locator()));
  locator.registerFactory(
    () => TvSearchBloc(
      locator(),
    ),
  );
  locator.registerFactory<TvWatchlistBloc>(
      () => TvWatchlistBloc(locator(), locator(), locator(), locator()));

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  // use case Tv
  locator.registerLazySingleton(() => GetNowPlayingTv(locator()));
  locator.registerLazySingleton(() => GetPopularTv(locator()));
  locator.registerLazySingleton(() => GetTopRatedTv(locator()));
  locator.registerLazySingleton(() => GetDetailTv(locator()));
  locator.registerLazySingleton(() => GetRecommendationTv(locator()));
  locator.registerLazySingleton(() => SearchTv(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTv(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTv(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTv(locator()));
  locator.registerLazySingleton(() => GetWatchlistTv(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // repository tv
  locator.registerLazySingleton<TvRepository>(
    () => TvRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // domain sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  // domain sources tv
  locator.registerLazySingleton<TvRemoteDataSource>(
      () => TvRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvLocalDataSource>(
      () => TvLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // helper tv
  locator.registerLazySingleton<DatabaseHelperTv>(() => DatabaseHelperTv());

  // external
  locator.registerLazySingleton(() => http.Client());
}
