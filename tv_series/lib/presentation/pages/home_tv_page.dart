import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:search/search.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeTvPage extends StatefulWidget {
  static const routeName = '/hometv';

  const HomeTvPage({Key? key}) : super(key: key);

  @override
  State<HomeTvPage> createState() => _HomeTvPageState();
}

class _HomeTvPageState extends State<HomeTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvNowPlayingBloc>().add(TvNowPlaying());
      context.read<TvPopularBloc>().add(OnTvPopularCalled());
      context.read<TvTopRatedBloc>().add(OnTvTopRatedCalled());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchTvPage.routeName);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing',
                style: kHeading6,
              ),
              BlocBuilder<TvNowPlayingBloc, TvNowPlayingState>(
                  builder: (context, state) {
                if (state is TvNowPlayingLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvNowPlayingHasData) {
                  final data = state.result;
                  return TvList(data);
                } else if (state is TvNowPlayingError) {
                  return const Text(
                    'Failed to fetch data',
                    key: Key('error_msg'),
                  );
                } else {
                  return Container();
                }
              }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularTvPage.routeName),
              ),
              BlocBuilder<TvPopularBloc, TvPopularState>(
                  builder: (context, state) {
                if (state is TvPopularLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvPopularHasData) {
                  final data = state.result;
                  return TvList(data);
                } else if (state is TvPopularError) {
                  return const Text(
                    'Failed to fetch data',
                    key: Key('error_msg'),
                  );
                } else {
                  return Container();
                }
              }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedTvPage.routeName),
              ),
              BlocBuilder<TvTopRatedBloc, TvTopRatedState>(
                  builder: (context, state) {
                if (state is TvTopRatedLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvTopRatedHasData) {
                  final data = state.result;
                  return TvList(data);
                } else if (state is TvTopRatedError) {
                  return const Text(
                    'Failed to fetch data',
                    key: Key('error_msg'),
                  );
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvList extends StatelessWidget {
  final List<Tv> tvs;

  const TvList(this.tvs, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = tvs[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvDetailPage.routeName,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${tv.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvs.length,
      ),
    );
  }
}
