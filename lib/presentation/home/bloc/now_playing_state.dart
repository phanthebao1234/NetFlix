import 'package:netflix/domain/movie/entities/movie.dart';

abstract class NowPlayingState {}

class TrendingsMoviesLoading extends NowPlayingState {}

class TrendingsMoviesLoaded extends NowPlayingState {
  final List<MovieEntity> movies;
  TrendingsMoviesLoaded({required this.movies});
}

class FailureLoadTrendingsMovies extends NowPlayingState {
  final String errorMessage;
  FailureLoadTrendingsMovies({required this.errorMessage});
}
