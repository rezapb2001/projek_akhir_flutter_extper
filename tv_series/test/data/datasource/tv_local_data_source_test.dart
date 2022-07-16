import 'dart:convert';
import 'package:core/core.dart';
import 'package:tv_series/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../tv_helper/test_helper.mock.dart';
import '../../json_reader.dart';

void main() {
  late TvRemoteDataSourceImpl dataSourceImpl;
  late MockIOClient mockIOClient;

  setUp(() {
    mockIOClient = MockIOClient();
    dataSourceImpl = TvRemoteDataSourceImpl(client: mockIOClient);
  });

  group('get Now Playing Tv', () {
    final tTvList = TvResponse.fromJson(json.decode(
        readJson('dummy_data/dummy_data_tv/tv_now_playing_test.json')))
        .tvList;

    test('should return list of Tv Model when the response code is 200',
            () async {
          // arrange
          when(mockIOClient.get(Uri.parse('$baseURL/tv/on_the_air?$apiKey')))
              .thenAnswer((_) async => http.Response(
              readJson('dummy_data/dummy_data_tv/tv_now_playing_test.json.json'),
              200));
          // act
          final result = await dataSourceImpl.getNowPlaying();
          // assert
          expect(result, equals(tTvList));
        });

    test(
        'should throw a ServerException when the response code is 404 or other',
            () async {
          // arrange
          when(mockIOClient.get(Uri.parse('$baseURL/tv/on_the_air?$apiKey')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSourceImpl.getNowPlaying();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get Popular Tv', () {
    final tTvList = TvResponse.fromJson(json
        .decode(readJson('dummy_data/dummy_data_tv/tv_populer_test.json')))
        .tvList;

    test('should return list of tv when response is success (200)', () async {
      // arrange
      when(mockIOClient.get(Uri.parse('$baseURL/tv/popular?$apiKey')))
          .thenAnswer((_) async => http.Response(
          readJson('dummy_data/dummy_data_tv/tv_populer_test.json'), 200));
      // act
      final result = await dataSourceImpl.getPopularTv();
      // assert
      expect(result, tTvList);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
            () async {
          // arrange
          when(mockIOClient.get(Uri.parse('$baseURL/tv/popular?$apiKey')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSourceImpl.getPopularTv();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get Top Rated Tv', () {
    final tTvList = TvResponse.fromJson(json
        .decode(readJson('dummy_data/dummy_data_tv/tv_top_rated_test.json')))
        .tvList;

    test('should return list of tv when response code is 200 ', () async {
      // arrange
      when(mockIOClient.get(Uri.parse('$baseURL/tv/top_rated?$apiKey')))
          .thenAnswer((_) async => http.Response(
          readJson('dummy_data/dummy_data_tv/tv_top_rated_test.json'), 200));
      // act
      final result = await dataSourceImpl.getTopRatedTv();
      // assert
      expect(result, tTvList);
    });

    test('should throw ServerException when response code is other than 200',
            () async {
          // arrange
          when(mockIOClient.get(Uri.parse('$baseURL/tv/top_rated?$apiKey')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSourceImpl.getTopRatedTv();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get tv detail', () {
    const tId = 1;
    final tTvDetail = TvDetailResponse.fromJson(
        json.decode(readJson('dummy_data/dummy_data_tv/tv_detail_test.json')));

    test('should return movie detail when the response code is 200', () async {
      // arrange
      when(mockIOClient.get(Uri.parse('$baseURL/tv/$tId?$apiKey'))).thenAnswer(
              (_) async => http.Response(
              readJson('dummy_data/dummy_data_tv/tv_detail_test.json'), 200));
      // act
      final result = await dataSourceImpl.getDetailTv(tId);
      // assert
      expect(result, equals(tTvDetail));
    });

    test('should throw Server Exception when the response code is 404 or other',
            () async {
          // arrange
          when(mockIOClient.get(Uri.parse('$baseURL/tv/$tId?$apiKey')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSourceImpl.getDetailTv(tId);
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get tv recommendations', () {
    final tTvList = TvResponse.fromJson(json.decode(
        readJson('dummy_data/dummy_data_tv/tv_rekomendasi_test.json')))
        .tvList;
    const tId = 1;

    test('should return list of Tv Model when the response code is 200',
            () async {
          // arrange
          when(mockIOClient
              .get(Uri.parse('$baseURL/tv/$tId/recommendations?$apiKey')))
              .thenAnswer((_) async => http.Response(
              readJson('dummy_data/dummy_data_tv/tv_rekomendasi_test.json'),
              200));
          // act
          final result = await dataSourceImpl.getRecommendedTv(tId);
          // assert
          expect(result, equals(tTvList));
        });

    test('should throw Server Exception when the response code is 404 or other',
            () async {
          // arrange
          when(mockIOClient
              .get(Uri.parse('$baseURL/tv/$tId/recommendations?$apiKey')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSourceImpl.getRecommendedTv(tId);
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('search tv', () {
    final tSearchResult = TvResponse.fromJson(
        json.decode(readJson('dummy_data/dummy_data_tv/tv_search_test.json')))
        .tvList;
    const tQuery = 'Game Of Thrones';

    test('should return list of tv when response code is 200', () async {
      // arrange
      when(mockIOClient
          .get(Uri.parse('$baseURL/search/tv?$apiKey&query=$tQuery')))
          .thenAnswer((_) async => http.Response(
          readJson('dummy_data/dummy_data_tv/tv_search_test.json'), 200));
      // act
      final result = await dataSourceImpl.getSearchTv(tQuery);
      // assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200',
            () async {
          // arrange
          when(mockIOClient
              .get(Uri.parse('$baseURL/search/tv?$apiKey&query=$tQuery')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSourceImpl.getSearchTv(tQuery);
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });
}
