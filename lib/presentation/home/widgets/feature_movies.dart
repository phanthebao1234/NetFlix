import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/helper/utities/clean_url.dart';
import 'package:netflix/core/configs/assets/app_images.dart';
import 'package:netflix/presentation/home/bloc/feature_cubit.dart';
import 'package:netflix/presentation/home/bloc/feature_state.dart';

class FeatureMovies extends StatelessWidget {
  const FeatureMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeatureCubit()..getfeatureMovies(),
      child: BlocBuilder<FeatureCubit, GenericState>(builder: (context, state) {
        if (state is FeatureMoviesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FeatureMoviesLoaded) {
          return Column(
            children: [
              const Text('Feature Movies'),
              Image.network(
                cleanUrl(state.movies
                    .map((item) =>
                        (AppImages.kkImageBasePath + item.seoOnPage.ogImage[2]))
                    .toString()),
                width: 400,
                height: 400,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ),
            ],
          );
        }
        if (state is FailureLoadFeatureMovies) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
