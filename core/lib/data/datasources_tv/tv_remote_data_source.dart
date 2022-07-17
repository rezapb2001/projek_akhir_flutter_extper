import 'package:core/core.dart';
import 'package:tv_series/tv_series.dart';

import 'dart:convert';
import 'package:http/io_client.dart';


abstract class TvRemoteDataSource {
  Future<List<TvModel>> getNowPlaying();
  Future<List<TvModel>> getPopularTv();
  Future<List<TvModel>> getTopRatedTv();
  Future<TvDetailResponse> getDetailTv(int id);
  Future<List<TvModel>> getRecommendedTv(int id);
  Future<List<TvModel>> getSearchTv(String query);
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {

  final IOClient client;

  TvRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvModel>> getNowPlaying() async {
    final response =
    await client.get(Uri.parse('$baseURL/tv_series/on_the_air?$apiKey'));
    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getPopularTv() async {
    final response =
    await client.get(Uri.parse('$baseURL/tv_series/popular?$apiKey'));
    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async {
    final response =
    await client.get(Uri.parse('$baseURL/tv_series/top_rated?$apiKey'));
    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvDetailResponse> getDetailTv(int id) async {
    final response = await client.get(Uri.parse('$baseURL/tv_series/$id?$apiKey'));
    if (response.statusCode == 200) {
      return TvDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getRecommendedTv(int id) async {
    final response = await client
        .get(Uri.parse('$baseURL/tv_series/$id/recommendations?$apiKey'));
    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getSearchTv(String query) async {
    final response = await client
        .get(Uri.parse('$baseURL/search/tv_series?$apiKey&query=$query'));
    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }
}
