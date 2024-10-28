import 'package:netflix/data/kkphim_movie/models/feature_movie_model.dart';

class FeatureEntity {
  final SeoOnPage seoOnPage;
  final List<BreadCrumb> breadCrumb;
  final String titlePage;
  final List<Item> items;
  final Params params;
  final String typeList;
  final String appDomainFrontend;
  final String appDomainCdnImage;

  FeatureEntity({
    required this.seoOnPage,
    required this.breadCrumb,
    required this.titlePage,
    required this.items,
    required this.params,
    required this.typeList,
    required this.appDomainFrontend,
    required this.appDomainCdnImage,
  });
}
