import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/watch/bloc/trailer_cubit.dart';
import 'package:netflix/presentation/watch/bloc/trailer_state.dart';

import 'package:netflix/presentation/watch/bloc/tv_trailer_cubit.dart';
import 'package:netflix/presentation/watch/bloc/tv_trailer_state.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatelessWidget {
  final int id;
  final String name;
  const VideoPlayerWidget({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return (name == 'movie'
        ? BlocProvider(
            create: (context) => TrailerCubit()..getMovieTrailer(id),
            child: BlocBuilder<TrailerCubit, TrailerState>(
              builder: (context, state) {
                if (state is TrailerLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is TrailerLoaded) {
                  return YoutubePlayer(
                    controller: state.youtubePlayerController,
                    showVideoProgressIndicator: true,
                  );
                }
                if (state is FailureLoadTrailer) {
                  return Center(child: Text(state.errorMessage));
                }
                return Container();
              },
            ),
          )
        : BlocProvider(
            create: (context) => TVTrailerCubit()..getTVTrailer(id),
            child: BlocBuilder<TVTrailerCubit, TVTrailerState>(
              builder: (context, state) {
                if (state is TVTrailerLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is TVTrailerLoaded) {
                  return YoutubePlayer(
                    controller: state.youtubePlayerController,
                    showVideoProgressIndicator: true,
                  );
                }
                if (state is FailureLoadTVTrailer) {
                  return Center(child: Text(state.errorMessage));
                }
                return Container();
              },
            ),
          ));
  }
}
