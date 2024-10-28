import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/configs/assets/app_images.dart';
import 'package:netflix/presentation/home/bloc/trendings_cubit.dart';
import 'package:netflix/presentation/home/bloc/trendings_state.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlaying()..getTrendingMovies(),
      child: BlocBuilder<NowPlaying, TrendingsState>(builder: (context, state) {
        if (state is TrendingsMoviesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TrendingsMoviesLoaded) {
          return FanCarouselImageSlider.sliderType1(
            imagesLink: state.movies
                .map((item) =>
                    AppImages.movieImageBasePath + item.posterPath.toString())
                .toList(),
            isAssets: false,
            autoPlay: false,
            sliderHeight: 400,
            showIndicator: true,
          );
        }
        if (state is FailureLoadTrendingsMovies) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
