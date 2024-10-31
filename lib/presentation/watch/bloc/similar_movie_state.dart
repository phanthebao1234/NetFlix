import 'package:netflix/domain/movie/entities/movie.dart';

abstract class SimilarMovieState {}

class SimilarMovieLoading extends SimilarMovieState {}

class SimilarMovieLoaded extends SimilarMovieState {
  final List<TVEntity> movies;
  SimilarMovieLoaded({required this.movies});
}

class FailureLoadSimilarMovie extends SimilarMovieState {
  final String errorMessage;
  FailureLoadSimilarMovie({required this.errorMessage});
}
