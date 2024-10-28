import 'package:flutter/material.dart';
import 'package:netflix/core/configs/assets/app_images.dart';
import 'package:netflix/core/configs/theme/app_colors.dart';
import 'package:netflix/domain/movie/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final TVEntity movieEntity;
  const MovieCard({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppNavigator.push(context, ProductDetailPage(productEntity: movieEntity,));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(AppImages.movieImageBasePath +
                            movieEntity.posterPath!)),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieEntity.title!,
                      style: const TextStyle(
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          movieEntity.voteAverage!.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
