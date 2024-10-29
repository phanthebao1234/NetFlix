import 'package:dartz/dartz.dart';
import 'package:netflix/common/helper/mapper/movie_mapper.dart';
import 'package:netflix/common/helper/mapper/trailer_mapper.dart';
import 'package:netflix/core/models/trailer_model.dart';
import 'package:netflix/data/movie/models/movie.dart';
import 'package:netflix/data/movie/sources/movie_service.dart';
import 'package:netflix/domain/movie/repositories/movie.dart';
import 'package:netflix/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovie();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getNowplayingMovies() async {
    var returnedData = await sl<MovieService>().getNowplayingMovie();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getMovieTrailer(int id) async {
    var returnedData = await sl<MovieService>().getMovieTrailer(id);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movie = TrailerMapper.toEntity(TrailerModel.fromJson(data['trailer']));
        return Right(movie);
      },
    );
  }
}
