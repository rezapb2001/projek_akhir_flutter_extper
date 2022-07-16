import 'package:ditonton/domain/datasources/db/database_helper.dart';
import 'package:ditonton/domain/datasources/db/database_helper_tv.dart';
import 'package:ditonton/domain/datasources/db/movie/movie_local_data_source.dart';
import 'package:ditonton/domain/datasources/db/movie/movie_remote_data_source.dart';
import 'package:ditonton/domain/datasources/db/tv/tv_local_data_source.dart';
import 'package:ditonton/domain/datasources/db/tv/tv_remote_data_source.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
  TvRepository,
  TvRemoteDataSource,
  TvLocalDataSource,
  DatabaseHelperTv,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
