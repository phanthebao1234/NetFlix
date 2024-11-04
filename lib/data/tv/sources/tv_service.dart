import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix/core/constants/api_url.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/service_locator.dart';

abstract class TVService {
  Future<Either> getPopularTV();
  Future<Either> getRecommendationTvs(int tvId);
  Future<Either> getSimilarTvs(int tvId);
  Future<Either> getKeywordTvs(int tvId);
  Future<Either> searchTVs(String query);
}

class TVApiServiceImpl extends TVService {
  @override
  Future<Either> getPopularTV() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.popularTV);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationTvs(int tvId) async {
    try {
      var response =
          await sl<DioClient>().get('${ApiUrl.tv}$tvId/recommendations');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarTvs(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.tv}$tvId/similar');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getKeywordTvs(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.tv}$tvId/keywords');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> searchTVs(String query) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.search}tv/$query');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
