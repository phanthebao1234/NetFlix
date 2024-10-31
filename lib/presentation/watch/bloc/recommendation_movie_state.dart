import 'package:netflix/domain/movie/entities/movie.dart';

abstract class RecommendationMovieState {}

class RecommendationMovieLoading extends RecommendationMovieState {}

class RecommendationMovieLoaded extends RecommendationMovieState {
  final List<TVEntity> movies;
  RecommendationMovieLoaded({required this.movies});
}

class FailureLoadRecommendationMovie extends RecommendationMovieState {
  final String errorMessage;
  FailureLoadRecommendationMovie({required this.errorMessage});
}
