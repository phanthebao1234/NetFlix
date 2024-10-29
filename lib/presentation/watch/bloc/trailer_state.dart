import 'package:chewie/chewie.dart';
import 'package:netflix/core/entity/trailer_entity.dart';

abstract class TrailerState {}

class TrailerMovieLoading extends TrailerState {}

class TrailerMovieLoaded extends TrailerState {
  final ChewieController chewieController;
  TrailerMovieLoaded({required this.chewieController});
  // final TrailerEntity trailerEntity;
  // TrailerMovieLoaded({required this.trailerEntity});
}

class FailureLoadTrailerMovie extends TrailerState {
  final String errorMessage;
  FailureLoadTrailerMovie({required this.errorMessage});
}
