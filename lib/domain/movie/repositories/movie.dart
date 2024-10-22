import 'package:dartz/dartz.dart';
import 'package:netflix/common/helper/mapper/movie_mapper.dart';
import 'package:netflix/data/movie/models/movie.dart';
import 'package:netflix/data/movie/sources/movie_service.dart';
import 'package:netflix/service_locator.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovie() async {
    var results = await sl<MovieService>().getTrendingMovie();
    return results.fold((error) {
      return Left(error);
    }, (data) {
      // chuyển đổi dữ liệu JSON thành danh sách các thực thể phim (Movie) sử dụng MovieMapper, và trả về Right(movies).
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }
}
