import 'package:dartz/dartz.dart';

abstract class NewMovieRepository {
  Future<Either> getNewMovies();
}
