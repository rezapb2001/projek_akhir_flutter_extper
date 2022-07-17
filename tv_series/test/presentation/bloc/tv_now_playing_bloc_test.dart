import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_now_playing_bloc_test.mock.dart';

@GenerateMocks([GetNowPlayingTv])
void main() {
  late MockGetNowPlaying mockGetNowPlaying;
  late TvNowPlayingBloc tvNowPlayingBloc;

  setUp(() {
    mockGetNowPlaying = MockGetNowPlaying();
    tvNowPlayingBloc = TvNowPlayingBloc(mockGetNowPlaying);
  });

  test('the OnTheAirTvseriesBloc initial state should be empty ', () {
    expect(tvNowPlayingBloc.state, TvNowPlayingEmpty());
  });

  blocTest<TvNowPlayingBloc, TvNowPlayingState>(
      'should emits OnTheAirTvseriesLoading state and then OnTheAirTvseriesHasData state when data is successfully fetched..',
      build: () {
        when(mockGetNowPlaying.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));
        return tvNowPlayingBloc;
      },
      act: (bloc) => bloc.add(TvNowPlaying()),
      expect: () => <TvNowPlayingState>[
        TvNowPlayingLoading(),
        TvNowPlayingHasData(testTvSeriesList),
      ],
      verify: (bloc) {
        verify(mockGetNowPlaying.execute());
        return TvNowPlaying().props;
      });

  blocTest<TvNowPlayingBloc, TvNowPlayingState>(
    'should emits OnTheAirTvseriesLoading state and then OnTheAirTvseriesError state when data is failed fetched..',
    build: () {
      when(mockGetNowPlaying.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvNowPlayingBloc;
    },
    act: (bloc) => bloc.add(TvNowPlaying()),
    expect: () => <TvNowPlayingState>[
      TvNowPlayingLoading(),
      TvNowPlayingError('Server Failure'),
    ],
    verify: (bloc) => TvNowPlayingLoading(),
  );

  blocTest<TvNowPlayingBloc, TvNowPlayingState>(
    'should emits OnTheAirTvseriesLoading state and then OnTheAirTvseriesEmpty state when data is retrieved empty..',
    build: () {
      when(mockGetNowPlaying.execute())
          .thenAnswer((_) async => const Right([]));
      return tvNowPlayingBloc;
    },
    act: (bloc) => bloc.add(TvNowPlaying()),
    expect: () => <TvNowPlayingState>[
      TvNowPlayingLoading(),
      TvNowPlayingEmpty(),
    ],
  );
}
