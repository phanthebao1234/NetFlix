import 'package:netflix/domain/movie_kkphim/entities/feature_entity.dart';

abstract class GenericState {}

class FeatureMoviesLoading extends GenericState {}

class FeatureMoviesLoaded extends GenericState {
  final List<FeatureEntity> movies;
  FeatureMoviesLoaded({required this.movies});
}

class FailureLoadFeatureMovies extends GenericState {
  final String errorMessage;
  FailureLoadFeatureMovies({required this.errorMessage});
}
