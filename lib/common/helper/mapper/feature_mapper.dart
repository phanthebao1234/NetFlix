import 'package:netflix/data/kkphim_movie/models/feature_movie_model.dart';
import 'package:netflix/domain/movie_kkphim/entities/feature_entity.dart';

class FeatureMapper {
  static FeatureEntity toEntity(FeatureMoive movie) {
    return FeatureEntity(
      seoOnPage: movie.seoOnPage,
      breadCrumb: movie.breadCrumb,
      titlePage: movie.titlePage,
      items: movie.items,
      params: movie.params,
      typeList: movie.typeList,
      appDomainFrontend: movie.appDomainFrontend,
      appDomainCdnImage: movie.appDomainCdnImage,
    );
  }
}
