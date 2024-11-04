
import 'package:netflix/domain/movie/entities/movie.dart';
import 'package:netflix/domain/tv/entities/tv_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class MovieLoaded extends SearchState {
  final List<MovieEntity> movie;

  MovieLoaded({required this.movie});
}

class TVLoaded extends SearchState {
  final List<TVEntity> tv;

  TVLoaded({required this.tv});
}

class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure({required this.errorMessage});
}
