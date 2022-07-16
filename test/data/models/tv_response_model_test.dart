import 'dart:convert';
import 'package:ditonton/domain/models/tv/tv_model.dart';
import 'package:ditonton/domain/models/tv/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final tTvSeriesModel = TvModel(
    backdropPath: "/baMG7mRtR52eLHz4b1OZchr1Jwb.jpg",
    genreIds: [80,
      18],
    id: 63351,
    originalName: "Narcos",
    overview: "Narcos chronicles the life and death of drug lord Pablo Escobar the ruthless boss of the Medellin Cartel and a known terrorist who was also a congressman, a family man and revered by the poor as a new Robin Hood.",
    popularity: 12.106431,
    posterPath: "/3CEu32C7udZzIjZcrKmdHcRB1ZN.jpg",
    firstAirDate: "2015-08-28",
    name: "Narcos",
    voteAverage: 7.33,
    voteCount: 65,
  );
  final tTvSeriesResponseModel = TvResponse(tvList: <TvModel>[tTvSeriesModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/dummy_data_tv/tv_now_playing_test.json'));
      // act
      final result = TvResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvSeriesResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper domain', () async {
      // arrange

      // act
      final result = tTvSeriesResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/baMG7mRtR52eLHz4b1OZchr1Jwb.jpg",
            "genre_ids": [
              80,
              18
            ],
            "id": 63351,
            "original_name": "Narcos",
            "overview": "Narcos chronicles the life and death of drug lord Pablo Escobar the ruthless boss of the Medellin Cartel and a known terrorist who was also a congressman, a family man and revered by the poor as a new Robin Hood.",
            "popularity": 12.106431,
            "poster_path": "/3CEu32C7udZzIjZcrKmdHcRB1ZN.jpg",
            "first_air_date": "2015-08-28",
            "name": "Narcos",
            "vote_average": 7.33,
            "vote_count": 65
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
