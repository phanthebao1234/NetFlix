import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/configs/assets/app_images.dart';
import 'package:netflix/presentation/home/bloc/trendings_cubit.dart';
import 'package:netflix/presentation/home/bloc/trendings_state.dart';

class NewMovies extends StatelessWidget {
  const NewMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlaying()..getTrendingMovies(),
      child: BlocBuilder<NowPlaying, TrendingsState>(builder: (context, state) {
        if (state is TrendingsMoviesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TrendingsMoviesLoaded) {
          FanCarouselImageSlider.sliderType2(
            imagesLink: state.movies
                .map((item) =>
                    AppImages.movieImageBasePath + item.posterPath.toString())
                .toList(),
            isAssets: false,
            autoPlay: false,
            sliderHeight: 300,
            currentItemShadow: const [],
            sliderDuration: const Duration(milliseconds: 200),
            imageRadius: 0,
            slideViewportFraction: 1.2,
          );
        } else if (state is FailureLoadTrendingsMovies) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
