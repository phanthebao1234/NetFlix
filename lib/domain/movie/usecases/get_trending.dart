import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/signup.dart';
import 'package:netflix/domain/movie/repositories/movie.dart';
import 'package:netflix/service_locator.dart';

class GetTrendingMoviesUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({ params}) async {
    return await sl<MovieRepository>().getTrendingMovie();
  }
}
