import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/helper/widgets/movie/movie_card.dart';
import 'package:netflix/presentation/home/bloc/now_playing_cubit.dart';
import 'package:netflix/presentation/home/bloc/now_playing_state.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTVCubit()..getNowPlayingMovies(),
      child: BlocBuilder<PopularTVCubit, NowPlayingState>(
          builder: (context, state) {
        if (state is NowPlayingMoviesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NowPlayingLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MovieCard(
                    movieEntity: state.movies[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.movies.length,
              ),
            ),
          );
        }
        if (state is FailureLoadNowPlayingMovies) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
