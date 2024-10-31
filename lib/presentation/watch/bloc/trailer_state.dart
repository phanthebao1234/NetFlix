import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState {}

class TrailerMovieLoading extends TrailerState {}

class TrailerMovieLoaded extends TrailerState {
  final YoutubePlayerController youtubePlayerController;
  TrailerMovieLoaded({required this.youtubePlayerController});
}

class FailureLoadTrailerMovie extends TrailerState {
  final String errorMessage;
  FailureLoadTrailerMovie({required this.errorMessage});
}
