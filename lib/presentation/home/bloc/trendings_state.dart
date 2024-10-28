import 'package:netflix/domain/movie/entities/movie.dart';

abstract class TrendingsState {}

class TrendingsMoviesLoading extends TrendingsState {}

class TrendingsMoviesLoaded extends TrendingsState {
  final List<TVEntity> movies;
  TrendingsMoviesLoaded({required this.movies});
}

class FailureLoadTrendingsMovies extends TrendingsState {
  final String errorMessage;
  FailureLoadTrendingsMovies({required this.errorMessage});
}
