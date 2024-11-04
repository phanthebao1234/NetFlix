import 'package:flutter/material.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/core/configs/assets/app_images.dart';
import 'package:netflix/core/configs/theme/app_colors.dart';
import 'package:netflix/domain/tv/entities/tv_entity.dart';
import 'package:netflix/presentation/watch/pages/tv_watch.dart';

class TVCard extends StatelessWidget {
  final TVEntity tvEntity;
  const TVCard({required this.tvEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
            context,
            TVWatchPage(
              tvEntity: tvEntity,
            ));
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
                        image: NetworkImage(tvEntity.providePosterPath())),
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
                      tvEntity.name!,
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
                          tvEntity.voteAverage!.toStringAsFixed(1),
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
