import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:watchlist/watchlist.dart';

part 'tv_watchlist_event.dart';
part 'tv_watchlist_state.dart';

class TvWatchlistBloc
    extends Bloc<TvWatchlistEvent, TvWatchlistState> {
  final GetWatchlistTv _getTvWatchlist;
  final GetWatchListStatusTv _getTvWatchListStatus;
  final RemoveWatchlistTv _removeTvWatchlist;
  final SaveWatchlistTv _saveTvWatchlist;
  TvWatchlistBloc(
      this._getTvWatchlist,
      this._getTvWatchListStatus,
      this._removeTvWatchlist,
      this._saveTvWatchlist,
      ) : super(TvWatchlistEmpty()) {
    on<OnTvWatchlistCalled>((event, emit) async {
      emit(TvWatchlistLoading());
      final result = await _getTvWatchlist.execute();
      result.fold(
            (failure) => emit(TvWatchlistError(failure.message)),
            (data) => data.isNotEmpty
            ? emit(TvWatchlistHasData(data))
            : emit(TvWatchlistEmpty()),
      );
    });

    on<FetchTvWatchlistStatus>(((event, emit) async {
      final id = event.id;

      final result = await _getTvWatchListStatus.execute(id);

      emit(TvWatchlistIsAdded(result));
    }));

    on<AddTvToWatchlist>(
      ((event, emit) async {
        final movie = event.tv;

        final result = await _saveTvWatchlist.execute(movie);

        result.fold(
              (failure) => emit(TvWatchlistError(failure.message)),
              (message) => emit(
                TvWatchlistMessage(message),
          ),
        );
      }),
    );

    on<RemoveTvFromWatchlist>(
      ((event, emit) async {
        final tv = event.tv;

        final result = await _removeTvWatchlist.execute(tv);

        result.fold(
              (failure) => emit(TvWatchlistError(failure.message)),
              (message) => emit(
                TvWatchlistMessage(message),
          ),
        );
      }),
    );
  }
}
