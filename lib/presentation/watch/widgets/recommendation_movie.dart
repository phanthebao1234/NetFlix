import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/helper/widgets/movie/movie_card.dart';
import 'package:netflix/presentation/watch/bloc/recommendation_movie_cubit.dart';
import 'package:netflix/presentation/watch/bloc/recommendation_movie_state.dart';

class RecommendationMovie extends StatelessWidget {
  const RecommendationMovie(
      {super.key, required this.movieId, required this.title});
  final int movieId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMovieCubit()..getRecommendationMovie(movieId),
      child: BlocBuilder<SimilarMovieCubit, RecommendationMovieState>(
          builder: (context, state) {
        if (state is RecommendationMovieLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RecommendationMovieLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movieEntity: state.movies[index],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: state.movies.length,
                ),
              ),
            ],
          );
        }
        if (state is FailureLoadRecommendationMovie) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
