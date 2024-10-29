import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> getNowplayingMovies();
  Future<Either> getMovieTrailer(int id);
}
