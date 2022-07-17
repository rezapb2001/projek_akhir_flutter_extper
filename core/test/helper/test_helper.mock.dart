
import 'dart:async' as _i8;
import 'dart:convert' as _i12;
import 'dart:typed_data' as _i13;

import 'package:core/core.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/io_client.dart' as _i6;
import 'package:http/src/base_request.dart' as _i14;
import 'package:http/src/client.dart' as _i11;
import 'package:http/src/response.dart' as _i4;
import 'package:http/src/streamed_response.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie/movie.dart' as _i7;
import 'package:sqflite_sqlcipher/sqflite.dart' as _i10;
import 'package:tv_series/tv_series.dart' as _i9;

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
    implements _i3.MovieDetailResponse {}

class _FakeTvDetailResponse_2 extends _i1.Fake implements _i3.TvDetailResponse {
}

class _FakeResponse_3 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_4 extends _i1.Fake implements _i5.StreamedResponse {
}

class _FakeIOStreamedResponse_5 extends _i1.Fake
    implements _i6.IOStreamedResponse {}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i7.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i3.Failure, List<_i7.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i7.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i7.Movie>>())) as _i8
          .Future<_i2.Either<_i3.Failure, List<_i7.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, List<_i7.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i7.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i7.Movie>>())) as _i8
          .Future<_i2.Either<_i3.Failure, List<_i7.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, List<_i7.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i7.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i7.Movie>>())) as _i8
          .Future<_i2.Either<_i3.Failure, List<_i7.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, _i7.MovieDetail>> getMovieDetail(
      int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
          returnValue: Future<_i2.Either<_i3.Failure, _i7.MovieDetail>>.value(
              _FakeEither_0<_i3.Failure, _i7.MovieDetail>())) as _i8
          .Future<_i2.Either<_i3.Failure, _i7.MovieDetail>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, List<_i7.Movie>>> getMovieRecommendations(
      int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i7.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i7.Movie>>())) as _i8
          .Future<_i2.Either<_i3.Failure, List<_i7.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, List<_i7.Movie>>> searchMovies(
      String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i7.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i7.Movie>>())) as _i8
          .Future<_i2.Either<_i3.Failure, List<_i7.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, String>> saveWatchlist(
      _i7.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [movie]),
          returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
              _FakeEither_0<_i3.Failure, String>()))
      as _i8.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, String>> removeWatchlist(
      _i7.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
              _FakeEither_0<_i3.Failure, String>()))
      as _i8.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i8.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, List<_i7.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i7.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i7.Movie>>())) as _i8
          .Future<_i2.Either<_i3.Failure, List<_i7.Movie>>>);
}

/// A class which mocks [TvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRepository extends _i1.Mock
    implements _i9.TvRepository {
  MockTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i3.Failure, List<_i9.Tv>>> getNowPlaying() =>
      (super
          .noSuchMethod(Invocation.method(#getNowPlaying, []),
          returnValue:
          Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>.value(
              _FakeEither_0<_i3.Failure, List<_i9.Tv>>()))
      as _i8.Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>
  getPopularTv() =>
      (super.noSuchMethod(Invocation.method(#getPopularTv, []),
          returnValue:
          Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>.value(
              _FakeEither_0<_i3.Failure, List<_i9.Tv>>()))
      as _i8.Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>
  getTopRatedTv() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTv, []),
          returnValue:
          Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>.value(
              _FakeEither_0<_i3.Failure, List<_i9.Tv>>()))
      as _i8.Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, _i9.TvDetail>> getTvDetail(
      int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvDetail, [id]),
          returnValue:
          Future<_i2.Either<_i3.Failure, _i9.TvDetail>>.value(
              _FakeEither_0<_i3.Failure, _i9.TvDetail>()))
      as _i8.Future<_i2.Either<_i3.Failure, _i9.TvDetail>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>
  getTvRecommendations(int? id) => (super.noSuchMethod(
      Invocation.method(#getTvRecommendations, [id]),
      returnValue:
      Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>.value(
          _FakeEither_0<_i3.Failure, List<_i9.Tv>>()))
  as _i8.Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, String>> saveWatchlistTv(
      _i9.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlistTv, [tv]),
          returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
              _FakeEither_0<_i3.Failure, String>()))
      as _i8.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, String>> removeWatchlistTv(
      _i9.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
          returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
              _FakeEither_0<_i3.Failure, String>()))
      as _i8.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i8.Future<bool> isAddedToWatchlistTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlistTv, [id]),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>
  getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
          returnValue:
          Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>.value(
              _FakeEither_0<_i3.Failure, List<_i9.Tv>>()))
      as _i8.Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>);
  @override
  _i8.Future<_i2.Either<_i3.Failure, List<_i9.Tv>>> searchTv(
      String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTv, [query]),
          returnValue:
          Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>.value(
              _FakeEither_0<_i3.Failure, List<_i9.Tv>>()))
      as _i8.Future<_i2.Either<_i3.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i3.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i3.MovieModel>> getNowPlayingMovies() => (super.noSuchMethod(
      Invocation.method(#getNowPlayingMovies, []),
      returnValue: Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
  as _i8.Future<List<_i3.MovieModel>>);
  @override
  _i8.Future<List<_i3.MovieModel>> getPopularMovies() => (super.noSuchMethod(
      Invocation.method(#getPopularMovies, []),
      returnValue: Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
  as _i8.Future<List<_i3.MovieModel>>);
  @override
  _i8.Future<List<_i3.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
      Invocation.method(#getTopRatedMovies, []),
      returnValue: Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
  as _i8.Future<List<_i3.MovieModel>>);
  @override
  _i8.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
          returnValue: Future<_i3.MovieDetailResponse>.value(
              _FakeMovieDetailResponse_1()))
      as _i8.Future<_i3.MovieDetailResponse>);
  @override
  _i8.Future<List<_i3.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
          returnValue:
          Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
      as _i8.Future<List<_i3.MovieModel>>);
  @override
  _i8.Future<List<_i3.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
          returnValue:
          Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
      as _i8.Future<List<_i3.MovieModel>>);
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i3.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i3.TvModel>> getNowPlaying() =>
      (super.noSuchMethod(Invocation.method(#getNowPlaying, []),
          returnValue:
          Future<List<_i3.TvModel>>.value(<_i3.TvModel>[]))
      as _i8.Future<List<_i3.TvModel>>);
  @override
  _i8.Future<List<_i3.TvModel>> getPopularTv() =>
      (super.noSuchMethod(Invocation.method(#getPopularTv, []),
          returnValue:
          Future<List<_i3.TvModel>>.value(<_i3.TvModel>[]))
      as _i8.Future<List<_i3.TvModel>>);
  @override
  _i8.Future<List<_i3.TvModel>> getTopRatedTv() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTv, []),
          returnValue:
          Future<List<_i3.TvModel>>.value(<_i3.TvModel>[]))
      as _i8.Future<List<_i3.TvModel>>);
  @override
  _i8.Future<_i3.TvDetailResponse> getDetailTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailTv, [id]),
          returnValue:
          Future<_i3.TvDetailResponse>.value(_FakeTvDetailResponse_2()))
      as _i8.Future<_i3.TvDetailResponse>);
  @override
  _i8.Future<List<_i3.TvModel>> getRecommendedTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#getRecommendedTv, [id]),
          returnValue:
          Future<List<_i3.TvModel>>.value(<_i3.TvModel>[]))
      as _i8.Future<List<_i3.TvModel>>);
  @override
  _i8.Future<List<_i3.TvModel>> getSearchTv(String? query) =>
      (super.noSuchMethod(Invocation.method(#getSearchTv, [query]),
          returnValue:
          Future<List<_i3.TvModel>>.value(<_i3.TvModel>[]))
      as _i8.Future<List<_i3.TvModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i3.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<String> insertWatchlist(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<String> removeWatchlist(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<_i3.MovieTable?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
          returnValue: Future<_i3.MovieTable?>.value())
      as _i8.Future<_i3.MovieTable?>);
  @override
  _i8.Future<List<_i3.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
      Invocation.method(#getWatchlistMovies, []),
      returnValue: Future<List<_i3.MovieTable>>.value(<_i3.MovieTable>[]))
  as _i8.Future<List<_i3.MovieTable>>);
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock
    implements _i3.TvLocalDataSource {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<String> insertWatchlist(_i3.TvTable? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [tv]),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<String> removeWatchlist(_i3.TvTable? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<_i3.TvTable?> getTvById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
          returnValue: Future<_i3.TvTable?>.value())
      as _i8.Future<_i3.TvTable?>);
  @override
  _i8.Future<List<_i3.TvTable>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
          returnValue:
          Future<List<_i3.TvTable>>.value(<_i3.TvTable>[]))
      as _i8.Future<List<_i3.TvTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i3.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i10.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
          returnValue: Future<_i10.Database?>.value())
      as _i8.Future<_i10.Database?>);
  @override
  _i8.Future<int> insertWatchlist(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i8.Future<int>);
  @override
  _i8.Future<int> removeWatchlist(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i8.Future<int>);
  @override
  _i8.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
          returnValue: Future<Map<String, dynamic>?>.value())
      as _i8.Future<Map<String, dynamic>?>);
  @override
  _i8.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<List<Map<String, dynamic>>>.value(
              <Map<String, dynamic>>[]))
      as _i8.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [DatabaseHelperTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperTv extends _i1.Mock
    implements _i3.DatabaseHelperTv {
  MockDatabaseHelperTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i10.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
          returnValue: Future<_i10.Database?>.value())
      as _i8.Future<_i10.Database?>);
  @override
  _i8.Future<List<Map<String, dynamic>>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
          returnValue: Future<List<Map<String, dynamic>>>.value(
              <Map<String, dynamic>>[]))
      as _i8.Future<List<Map<String, dynamic>>>);
  @override
  _i8.Future<int> insertWatchlistTv(_i3.TvTable? tvSeriesTable) => (super
      .noSuchMethod(Invocation.method(#insertWatchlistTv, [tvSeriesTable]),
      returnValue: Future<int>.value(0)) as _i8.Future<int>);
  @override
  _i8.Future<int> removeWatchlistTv(_i3.TvTable? tvSeriesTable) => (super
      .noSuchMethod(Invocation.method(#removeWatchlistTv, [tvSeriesTable]),
      returnValue: Future<int>.value(0)) as _i8.Future<int>);
  @override
  _i8.Future<Map<String, dynamic>?> getTvById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
          returnValue: Future<Map<String, dynamic>?>.value())
      as _i8.Future<Map<String, dynamic>?>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i11.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i8.Future<_i4.Response>);
  @override
  _i8.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i8.Future<_i4.Response>);
  @override
  _i8.Future<_i4.Response> post(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i12.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#post, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i8.Future<_i4.Response>);
  @override
  _i8.Future<_i4.Response> put(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i12.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#put, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i8.Future<_i4.Response>);
  @override
  _i8.Future<_i4.Response> patch(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i12.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#patch, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i8.Future<_i4.Response>);
  @override
  _i8.Future<_i4.Response> delete(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i12.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#delete, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i8.Future<_i4.Response>);
  @override
  _i8.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<_i13.Uint8List> readBytes(Uri? url,
      {Map<String, String>? headers}) =>
      (super.noSuchMethod(
          Invocation.method(#readBytes, [url], {#headers: headers}),
          returnValue: Future<_i13.Uint8List>.value(_i13.Uint8List(0)))
      as _i8.Future<_i13.Uint8List>);
  @override
  _i8.Future<_i5.StreamedResponse> send(_i14.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
          returnValue:
          Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_4()))
      as _i8.Future<_i5.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [IOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockIOClient extends _i1.Mock implements _i6.IOClient {
  MockIOClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i6.IOStreamedResponse> send(_i14.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
          returnValue: Future<_i6.IOStreamedResponse>.value(
              _FakeIOStreamedResponse_5()))
      as _i8.Future<_i6.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  _i8.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i8.Future<_i4.Response>);
  @override
  _i8.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i8.Future<_i4.Response>);
  @override
  _i8.Future<_i4.Response> post(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i12.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#post, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i8.Future<_i4.Response>);
  @override
  _i8.Future<_i4.Response> put(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i12.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#put, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i8.Future<_i4.Response>);
  @override
  _i8.Future<_i4.Response> patch(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i12.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#patch, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i8.Future<_i4.Response>);
  @override
  _i8.Future<_i4.Response> delete(Uri? url,
      {Map<String, String>? headers,
        Object? body,
        _i12.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#delete, [url],
              {#headers: headers, #body: body, #encoding: encoding}),
          returnValue: Future<_i4.Response>.value(_FakeResponse_3()))
      as _i8.Future<_i4.Response>);
  @override
  _i8.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<_i13.Uint8List> readBytes(Uri? url,
      {Map<String, String>? headers}) =>
      (super.noSuchMethod(
          Invocation.method(#readBytes, [url], {#headers: headers}),
          returnValue: Future<_i13.Uint8List>.value(_i13.Uint8List(0)))
      as _i8.Future<_i13.Uint8List>);
}
