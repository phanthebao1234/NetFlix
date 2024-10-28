
import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/signup.dart';
import 'package:netflix/domain/movie_kkphim/repositories/kkmovie.dart';
import 'package:netflix/service_locator.dart';

class GetFeatureMoviesUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<KKMovieRepository>().getFeatureMovies();
  }
}
