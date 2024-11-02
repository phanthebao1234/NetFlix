import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TVTrailerState {}

class TVTrailerLoading extends TVTrailerState {}

class TVTrailerLoaded extends TVTrailerState {
  final YoutubePlayerController youtubePlayerController;
  TVTrailerLoaded({required this.youtubePlayerController});
}

class FailureLoadTVTrailer extends TVTrailerState {
  final String errorMessage;
  FailureLoadTVTrailer({required this.errorMessage});
}
