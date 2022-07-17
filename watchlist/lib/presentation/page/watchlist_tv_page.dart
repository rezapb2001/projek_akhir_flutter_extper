import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:watchlist/watchlist.dart';

import 'package:flutter/material.dart';

class WatchlistTvPage extends StatefulWidget {
  static const routeName = '/watchlist-tv_series';

  const WatchlistTvPage({Key? key}) : super(key: key);

  @override
  State<WatchlistTvPage> createState() => _WatchlistTvsPageState();
}

class _WatchlistTvsPageState extends State<WatchlistTvPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<TvWatchlistBloc>().add(OnTvWatchlistCalled()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<TvWatchlistBloc>().add(OnTvWatchlistCalled());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvWatchlistBloc, TvWatchlistState>(
          builder: (context, state) {
            if (state is TvWatchlistLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvWatchlistEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "You don't have any series yet, lets add some!",
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomePage.routeName,
                            (route) => false,
                      ),
                      child: const Text('Add Series'),
                    ),
                  ],
                ),
              );
            } else if (state is TvWatchlistHasData) {
              final tvWatchlist = state.result;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = tvWatchlist[index];
                  return TvCard(tv);
                },
                itemCount: tvWatchlist.length,
              );
            } else {
              return const Center(
                key: Key('error_message'),
                child: Text('Failed to fetch data'),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
