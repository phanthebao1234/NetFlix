import 'package:dartz/dartz.dart';

abstract class TVRepositories {
  Future<Either> getPopularTV();
  Future<Either> getRecommendationTvs(int tvId);
  Future<Either> getSimilarTvs(int tvId);
  Future<Either> getKeywordTvs(int tvId);
  Future<Either> searchTVs(String query);
}
