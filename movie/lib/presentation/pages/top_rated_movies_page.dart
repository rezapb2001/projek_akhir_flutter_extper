import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';

import 'package:flutter/material.dart';

class TopRatedMoviesPage extends StatefulWidget {
  static const routeName = '/top-rated-movie';

  const TopRatedMoviesPage({Key? key}) : super(key: key);

  @override
  State<TopRatedMoviesPage> createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Future.microtask(() =>
        context.read<MovieTopRatedBloc>().add(OnMovieTopRatedCalled())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MovieTopRatedBloc, MovieTopRatedState>(
          builder: (context, state) {
            if (state is MovieTopRatedLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieTopRatedHasData) {
              final movies = state.result;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return MovieCard(movie);
                },
                itemCount: movies.length,
              );
            } else {
              return Center(
                key: const Key('error_msg'),
                child: Text((state as MovieTopRatedError).message),
              );
            }
          },
        ),
      ),
    );
  }
}
