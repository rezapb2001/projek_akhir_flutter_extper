import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tv_series/tv_series.dart';
import 'package:search/search.dart';

part 'tv_search_event.dart';
part 'tv_search_state.dart';


class TvSearchBloc
    extends Bloc<TvSearchEvent, TvSearchState> {
  final SearchTv _searchTv;
  TvSearchBloc(this._searchTv) : super(TvSearchEmpty()) {
    on<TvOnQueryChanged>(
          (event, emit) async {
        final query = event.query;

        emit(TvSearchLoading());

        final result = await _searchTv.execute(query);

        result.fold(
              (failure) {
            emit(TvSearchError(failure.message));
          },
              (data) {
            emit(TvSearchHasData(data));
          },
        );
      },
      transformer: tvDebounce(
        const Duration(milliseconds: 500),
      ),
    );
  }
  EventTransformer<T> tvDebounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
