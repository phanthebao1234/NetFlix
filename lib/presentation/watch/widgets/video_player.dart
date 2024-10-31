import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/watch/bloc/trailer_cubit.dart';
import 'package:netflix/presentation/watch/bloc/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatelessWidget {
  final int id;
  const VideoPlayerWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getTrailerMovie(id),
      child: BlocBuilder<TrailerCubit, TrailerState>(builder: (context, state) {
        if (state is TrailerMovieLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is TrailerMovieLoaded) {
          return YoutubePlayer(
            controller: state.youtubePlayerController,
            showVideoProgressIndicator: true,
          );
        }
        if (state is FailureLoadTrailerMovie) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      }),
    );
  }
}
