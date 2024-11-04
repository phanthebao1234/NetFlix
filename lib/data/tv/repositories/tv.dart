import 'package:dartz/dartz.dart';
import 'package:netflix/common/helper/mapper/keyword_mapper.dart';
import 'package:netflix/common/helper/mapper/tv_mapper.dart';
import 'package:netflix/core/models/keyword_model.dart';
import 'package:netflix/data/tv/model/tv_model.dart';
import 'package:netflix/data/tv/sources/tv_service.dart';
import 'package:netflix/domain/tv/repositories/tv.dart';
import 'package:netflix/service_locator.dart';

class TvRepositoriesImpl extends TVRepositories {
  @override
  Future<Either> getPopularTV() async {
    var returnedData = await sl<TVService>().getPopularTV();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tv = List.from(data['content'])
            .map((item) => TVMapper.toEntity(TVModel.fromJson(item)))
            .toList();
        return Right(tv);
      },
    );
  }

  @override
  Future<Either> getRecommendationTvs(int tvId) async {
    var returnedData = await sl<TVService>().getRecommendationTvs(tvId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tv = List.from(data['content'])
            .map((item) => TVMapper.toEntity(TVModel.fromJson(item)))
            .toList();
        return Right(tv);
      },
    );
  }

  @override
  Future<Either> getSimilarTvs(int tvId) async {
    var returnedData = await sl<TVService>().getSimilarTvs(tvId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tv = List.from(data['content'])
            .map((item) => TVMapper.toEntity(TVModel.fromJson(item)))
            .toList();
        return Right(tv);
      },
    );
  }
  
  @override
  Future<Either> getKeywordTvs(int tvId) async {
    var returnedData = await sl<TVService>().getKeywordTvs(tvId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tv = List.from(data['content'])
            .map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)))
            .toList();
        return Right(tv);
      },
    );
  }
  
  @override
  Future<Either> searchTVs(String query) async {
    var returnedData = await sl<TVService>().searchTVs(query);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tv = List.from(data['content'])
            .map((item) => TVMapper.toEntity(TVModel.fromJson(item)))
            .toList();
        return Right(tv);
      },
    );
  }
}
