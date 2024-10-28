import 'package:dartz/dartz.dart';

abstract class KKMovieRepository {
  Future<Either> getFeatureMovies();
}
