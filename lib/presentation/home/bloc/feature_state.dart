import 'package:netflix/domain/movie_kkphim/entities/feature_entity.dart';

abstract class FeatureState {}

class FeatureMoviesLoading extends FeatureState {}

class FeatureMoviesLoaded extends FeatureState {
  final List<FeatureEntity> movies;
  FeatureMoviesLoaded({required this.movies});
}

class FailureLoadFeatureMovies extends FeatureState {
  final String errorMessage;
  FailureLoadFeatureMovies({required this.errorMessage});
}
