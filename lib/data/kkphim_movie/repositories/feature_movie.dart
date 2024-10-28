import 'package:dartz/dartz.dart';
import 'package:netflix/common/helper/mapper/feature_mapper.dart';
import 'package:netflix/data/kkphim_movie/models/feature_movie_model.dart';
import 'package:netflix/data/kkphim_movie/sources/kkmovie_service.dart';
import 'package:netflix/domain/movie_kkphim/repositories/kkmovie.dart';
import 'package:netflix/service_locator.dart';

class FeatureMovieRepositoryImpl extends KKMovieRepository {
  @override
  Future<Either> getFeatureMovies() async {
    var returnedData = await sl<KKMovieService>().getFeaturedMovie();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        if (data['data'] is Map<String, dynamic>) {
          var featureMoive = FeatureMoive.fromJson(data['data']);
          var featureEntity = FeatureMapper.toEntity(featureMoive);
          print('data $data');
          return Right([featureEntity]); // Trả về danh sách chứa featureEntity
        } else {
          return Left('Data format is incorrect');
        }
      },
    );
  }
}
