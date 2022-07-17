// Mocks generated by Mockito 5.2.0 from annotations
// in tv/test/presentation/bloc/watchlist_tvs_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:core/core.dart' as _i5;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv/tv.dart' as _i3;

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

class _FakeTvRepository_1 extends _i1.Fake implements _i3.TvRepository {}

/// A class which mocks [GetWatchlistTvShows].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTvShows extends _i1.Mock
    implements _i3.GetWatchlistTvShows {
  MockGetWatchlistTvShows() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i3.Tv>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
              returnValue: Future<_i2.Either<_i5.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i5.Failure, List<_i3.Tv>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i3.Tv>>>);
}

/// A class which mocks [SaveTvWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveTvWatchlist extends _i1.Mock implements _i3.SaveTvWatchlist {
  MockSaveTvWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TvRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvRepository_1()) as _i3.TvRepository);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> execute(_i3.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#execute, [tv]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
}

/// A class which mocks [RemoveTvWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveTvWatchlist extends _i1.Mock implements _i3.RemoveTvWatchlist {
  MockRemoveTvWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TvRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvRepository_1()) as _i3.TvRepository);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> execute(_i3.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#execute, [tv]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
}

/// A class which mocks [GetWatchListTvStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListTvStatus extends _i1.Mock
    implements _i3.GetWatchListTvStatus {
  MockGetWatchListTvStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TvRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvRepository_1()) as _i3.TvRepository);
  @override
  _i4.Future<bool> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}
