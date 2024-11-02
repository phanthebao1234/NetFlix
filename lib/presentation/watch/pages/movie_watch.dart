import 'package:flutter/material.dart';
import 'package:netflix/common/helper/widgets/appbar/app_bar.dart';
import 'package:netflix/domain/movie/entities/movie.dart';
import 'package:netflix/presentation/watch/widgets/recommendation_movie.dart';
import 'package:netflix/presentation/watch/widgets/similar_movie.dart';
import 'package:netflix/presentation/watch/widgets/video_overview.dart';
import 'package:netflix/presentation/watch/widgets/video_player.dart';
import 'package:netflix/presentation/watch/widgets/video_release_date.dart';
import 'package:netflix/presentation/watch/widgets/video_title.dart';
import 'package:netflix/presentation/watch/widgets/video_vote_average.dart';

class MovieWatchPage extends StatelessWidget {
  const MovieWatchPage({super.key, required this.movieEntity, required this.name});
  final TVEntity movieEntity;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayerWidget(
              id: movieEntity.id!, name: 'movie',
            ),
            const SizedBox(
              height: 16,
            ),
            VideoTitleWidget(title: movieEntity.title!),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDateWidget(releaseDate: movieEntity.releaseDate!),
                VideoVoteAverageWidget(vote: movieEntity.voteAverage!),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            VideoOverviewWidget(overView: movieEntity.overview!),
            const SizedBox(
              height: 16,
            ),
            RecommendationMovie(
              movieId: movieEntity.id!,
              title: 'Recommend Movie',
            ),
            const SizedBox(
              height: 16,
            ),
            SimilarMovie(
              movieId: movieEntity.id!,
              title: 'Similar Movie',
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
