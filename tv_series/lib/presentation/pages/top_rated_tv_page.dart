import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

import 'package:flutter/material.dart';

class TopRatedTvPage extends StatefulWidget {
  static const routeName = '/top-rated-tv_series';

  const TopRatedTvPage({Key? key}) : super(key: key);

  @override
  State<TopRatedTvPage> createState() => _TopRatedTvPageState();
}

class _TopRatedTvPageState extends State<TopRatedTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<TvTopRatedBloc>().add(OnTvTopRatedCalled()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvTopRatedBloc, TvTopRatedState>(
          builder: (context, state) {
            if (state is TvTopRatedLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvTopRatedHasData) {
              final tvSeries = state.result;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = tvSeries[index];
                  return TvCard(tv);
                },
                itemCount: tvSeries.length,
              );
            } else {
              return Center(
                key: const Key('error_msg'),
                child: Text((state as TvTopRatedError).message),
              );
            }
          },
        ),
      ),
    );
  }
}
