import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv/tv.dart';

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
    Future.microtask(
      () => context.read<TopRatedTvShowsBloc>().add(FetchTopRatedTvShows()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedTvShowsBloc, TopRatedTvShowsState>(
          builder: (context, state) {
            if (state is TopRatedTvShowsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedTvShowsHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.result[index];
                  return TvCard(tv);
                },
                itemCount: state.result.length,
              );
            } else if (state is TopRatedTvShowsError) {
              return Center(
                key: const Key('error_message'),
                child: Text(state.message),
              );
            } else {
              return const Center();
            }
          },
        ),
      ),
    );
  }
}
