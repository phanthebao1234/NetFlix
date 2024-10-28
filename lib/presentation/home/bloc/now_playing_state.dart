import 'package:netflix/domain/movie/entities/movie.dart';

abstract class NowPlayingState {}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final List<TVEntity> movies;
  NowPlayingLoaded({required this.movies});
}

class FailureLoadNowPlayingMovies extends NowPlayingState {
  final String errorMessage;
  FailureLoadNowPlayingMovies({required this.errorMessage});
}
