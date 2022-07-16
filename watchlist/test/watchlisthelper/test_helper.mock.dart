import 'dart:async' as _i7;
import 'dart:convert' as _i10;
import 'dart:typed_data' as _i11;

import 'package:core/core.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:http/src/io_client.dart' as _i12;
import 'package:http/src/io_streamed_response.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie/movie.dart' as _i6;
import 'package:sqflite/sqflite.dart' as _i9;
import 'package:tv_series/tv_series.dart' as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeMovieDetailResponse_1 extends _i1.Fake
    implements _i6.MovieDetailResponse {}

class _FakeTvDetailResponse_2 extends _i1.Fake implements _i8.TvDetailResponse {
}

class _FakeResponse_3 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_4 extends _i1.Fake implements _i4.StreamedResponse {
}

class _FakeIOStreamedResponse_5 extends _i1.Fake
    implements _i5.IOStreamedResponse {}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i6.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i3.Failure, List<_i6.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i6.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i6.Movie>>())) as _i7
          .Future<_i2.Either<_i3.Failure, List<_i6.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, List<_i6.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i6.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i6.Movie>>())) as _i7
          .Future<_i2.Either<_i3.Failure, List<_i6.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, List<_i6.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i6.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i6.Movie>>())) as _i7
          .Future<_i2.Either<_i3.Failure, List<_i6.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, _i6.MovieDetail>> getMovieDetail(
      int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
          returnValue: Future<_i2.Either<_i3.Failure, _i6.MovieDetail>>.value(
              _FakeEither_0<_i3.Failure, _i6.MovieDetail>())) as _i7
          .Future<_i2.Either<_i3.Failure, _i6.MovieDetail>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, List<_i6.Movie>>> getMovieRecommendations(
      int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i6.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i6.Movie>>())) as _i7
          .Future<_i2.Either<_i3.Failure, List<_i6.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, List<_i6.Movie>>> searchMovies(
      String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i6.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i6.Movie>>())) as _i7
          .Future<_i2.Either<_i3.Failure, List<_i6.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, String>> saveWatchlist(
      _i6.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [movie]),
          returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
              _FakeEither_0<_i3.Failure, String>()))
      as _i7.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, String>> removeWatchlist(
      _i6.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
              _FakeEither_0<_i3.Failure, String>()))
      as _i7.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, List<_i6.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i6.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i6.Movie>>())) as _i7
          .Future<_i2.Either<_i3.Failure, List<_i6.Movie>>>);
}

/// A class which mocks [TvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRepository extends _i1.Mock
    implements _i8.TvRepository {
  MockTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i3.Failure, List<_i8.Tv>>> getNowPlaying() =>
      (super
          .noSuchMethod(Invocation.method(#getNowPlaying, []),
          returnValue:
          Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>.value(
              _FakeEither_0<_i3.Failure, List<_i8.Tv>>()))
      as _i7.Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>
  getPopularTv() =>
      (super.noSuchMethod(Invocation.method(#getPopularTv, []),
          returnValue:
          Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>.value(
              _FakeEither_0<_i3.Failure, List<_i8.Tv>>()))
      as _i7.Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>
  getTopRatedTv() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTv, []),
          returnValue:
          Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>.value(
              _FakeEither_0<_i3.Failure, List<_i8.Tv>>()))
      as _i7.Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, _i8.TvDetail>> getTvDetail(
      int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvDetail, [id]),
          returnValue:
          Future<_i2.Either<_i3.Failure, _i8.TvDetail>>.value(
              _FakeEither_0<_i3.Failure, _i8.TvDetail>()))
      as _i7.Future<_i2.Either<_i3.Failure, _i8.TvDetail>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>
  getTvRecommendations(int? id) => (super.noSuchMethod(
      Invocation.method(#getTvRecommendations, [id]),
      returnValue:
      Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>.value(
          _FakeEither_0<_i3.Failure, List<_i8.Tv>>()))
  as _i7.Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, String>> saveWatchlistTv(
      _i8.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlistTv, [tv]),
          returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
              _FakeEither_0<_i3.Failure, String>()))
      as _i7.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, String>> removeWatchlistTv(
      _i8.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
          returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
              _FakeEither_0<_i3.Failure, String>()))
      as _i7.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlistTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlistTv, [id]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>
  getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
          returnValue:
          Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>.value(
              _FakeEither_0<_i3.Failure, List<_i8.Tv>>()))
      as _i7.Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i3.Failure, List<_i8.Tv>>> searchTv(
      String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTv, [query]),
          returnValue:
          Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>.value(
              _FakeEither_0<_i3.Failure, List<_i8.Tv>>()))
      as _i7.Future<_i2.Either<_i3.Failure, List<_i8.Tv>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i6.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i6.MovieModel>> getNowPlayingMovies() => (super.noSuchMethod(
      Invocation.method(#getNowPlayingMovies, []),
      returnValue: Future<List<_i6.MovieModel>>.value(<_i6.MovieModel>[]))
  as _i7.Future<List<_i6.MovieModel>>);
  @override
  _i7.Future<List<_i6.MovieModel>> getPopularMovies() => (super.noSuchMethod(
      Invocation.method(#getPopularMovies, []),
      returnValue: Future<List<_i6.MovieModel>>.value(<_i6.MovieModel>[]))
  as _i7.Future<List<_i6.MovieModel>>);
  @override
  _i7.Future<List<_i6.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
      Invocation.method(#getTopRatedMovies, []),
      returnValue: Future<List<_i6.MovieModel>>.value(<_i6.MovieModel>[]))
  as _i7.Future<List<_i6.MovieModel>>);
  @override
  _i7.Future<_i6.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
          returnValue: Future<_i6.MovieDetailResponse>.value(
              _FakeMovieDetailResponse_1()))
      as _i7.Future<_i6.MovieDetailResponse>);
  @override
  _i7.Future<List<_i6.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
          returnValue:
          Future<List<_i6.MovieModel>>.value(<_i6.MovieModel>[]))
      as _i7.Future<List<_i6.MovieModel>>);
  @override
  _i7.Future<List<_i6.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
          returnValue:
          Future<List<_i6.MovieModel>>.value(<_i6.MovieModel>[]))
      as _i7.Future<List<_i6.MovieModel>>);
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i8.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i8.TvModel>> getNowPlaying() =>
      (super.noSuchMethod(Invocation.method(#getNowPlaying, []),
          returnValue:
          Future<List<_i8.TvModel>>.value(<_i8.TvModel>[]))
      as _i7.Future<List<_i8.TvModel>>);
  @override
  _i7.Future<List<_i8.TvModel>> getPopularTv() =>
      (super.noSuchMethod(Invocation.method(#getPopularTv, []),
          returnValue:
          Future<List<_i8.TvModel>>.value(<_i8.TvModel>[]))
      as _i7.Future<List<_i8.TvModel>>);
  @override
  _i7.Future<List<_i8.TvModel>> getTopRatedTv() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTv, []),
          returnValue:
          Future<List<_i8.TvModel>>.value(<_i8.TvModel>[]))
      as _i7.Future<List<_i8.TvModel>>);
  @override
  _i7.Future<_i8.TvDetailResponse> getDetailTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailTv, [id]),
          returnValue:
          Future<_i8.TvDetailResponse>.value(_FakeTvDetailResponse_2()))
      as _i7.Future<_i8.TvDetailResponse>);
  @override
  _i7.Future<List<_i8.TvModel>> getRecommendedTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#getRecommendedTv, [id]),
          returnValue:
          Future<List<_i8.TvModel>>.value(<_i8.TvModel>[]))
      as _i7.Future<List<_i8.TvModel>>);
  @override
  _i7.Future<List<_i8.TvModel>> getSearchTv(String? query) =>
      (super.noSuchMethod(Invocation.method(#getSearchTv, [query]),
          returnValue:
          Future<List<_i8.TvModel>>.value(<_i8.TvModel>[]))
      as _i7.Future<List<_i8.TvModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i6.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlist(_i6.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlist(_i6.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i6.MovieTable?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
          returnValue: Future<_i6.MovieTable?>.value())
      as _i7.Future<_i6.MovieTable?>);
  @override
  _i7.Future<List<_i6.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
      Invocation.method(#getWatchlistMovies, []),
      returnValue: Future<List<_i6.MovieTable>>.value(<_i6.MovieTable>[]))
  as _i7.Future<List<_i6.MovieTable>>);
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock
    implements _i8.TvLocalDataSource {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlist(_i8.TvTable? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [tv]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlist(_i8.TvTable? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i8.TvTable?> getTvById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
          returnValue: Future<_i8.TvTable?>.value())
      as _i7.Future<_i8.TvTable?>);
  @override
  _i7.Future<List<_i8.TvTable>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
          returnValue:
          Future<List<_i8.TvTable>>.value(<_i8.TvTable>[]))
      as _i7.Future<List<_i8.TvTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i6.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i9.Database?> get database => (super.noSuchMethod(
      Invocation.getter(#database),
      returnValue: Future<_i9.Database?>.value()) as _i7.Future<_i9.Database?>);
  @override
  _i7.Future<int> insertWatchlist(_i6.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlist(_i6.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
          returnValue: Future<Map<String, dynamic>?>.value())
      as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<List<Map<String, dynamic>>>.value(
              <Map<String, dynamic>>[]))
      as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [DatabaseHelperTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperTv extends _i1.Mock
    implements _i8.DatabaseHelperTv {
  MockDatabaseHelperTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i9.Database?> get database => (super.noSuchMethod(
      Invocation.getter(#database),
      returnValue: Future<_i9.Database?>.value()) as _i7.Future<_i9.Database?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
          returnValue: Future<List<Map<String, dynamic>>>.value(
              <Map<String, dynamic>>[]))
      as _i7.Future<List<Map<String, dynamic>>>);
  @override
  _i7.Future<int> insertWatchlistTv(_i8.TvTable? tvTable) => (super
      .noSuchMethod(Invocation.method(#insertWatchlistTv, [tvTable]),
      returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlistTv(_i8.TvTable? tvTable) => (super
      .noSuchMethod(Invocation.method(#removeWatchlistTv, [tvTable]),
      returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getTvById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
          returnValue: Future<Map<String, dynamic>?>.value())
      as _i7.Future<Map<String, dynamic>?>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i7.Future<_i4.Response>);
  @override
  _i7.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i7.Future<_i4.Response>);
  @override
  _i7.Future<_i4.Response> post(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#post, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i7.Future<_i4.Response>);
  @override
  _i7.Future<_i4.Response> put(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#put, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i7.Future<_i4.Response>);
  @override
  _i7.Future<_i4.Response> patch(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#patch, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i7.Future<_i4.Response>);
  @override
  _i7.Future<_i4.Response> delete(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#delete, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i7.Future<_i4.Response>);
  @override
  _i7.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i11.Uint8List> readBytes(Uri? url,
      {Map<String, String>? headers}) =>
      (super.noSuchMethod(
          Invocation.method(#readBytes, [url], {#headers: headers}),
          returnValue: Future<_i11.Uint8List>.value(_i11.Uint8List(0)))
      as _i7.Future<_i11.Uint8List>);
  @override
  _i7.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
          returnValue:
          Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_4()))
      as _i7.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [IOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockIOClient extends _i1.Mock implements _i12.IOClient {
  MockIOClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i5.IOStreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
          returnValue: Future<_i5.IOStreamedResponse>.value(
              _FakeIOStreamedResponse_5()))
      as _i7.Future<_i5.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  _i7.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i7.Future<_i4.Response>);
  @override
  _i7.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i7.Future<_i4.Response>);
  @override
  _i7.Future<_i4.Response> post(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#post, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i7.Future<_i4.Response>);
  @override
  _i7.Future<_i4.Response> put(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#put, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i7.Future<_i4.Response>);
  @override
  _i7.Future<_i4.Response> patch(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#patch, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i7.Future<_i4.Response>);
  @override
  _i7.Future<_i4.Response> delete(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#delete, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i7.Future<_i4.Response>);
  @override
  _i7.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i11.Uint8List> readBytes(Uri? url,
      {Map<String, String>? headers}) =>
      (super.noSuchMethod(
          Invocation.method(#readBytes, [url], {#headers: headers}),
          returnValue: Future<_i11.Uint8List>.value(_i11.Uint8List(0)))
      as _i7.Future<_i11.Uint8List>);
}
