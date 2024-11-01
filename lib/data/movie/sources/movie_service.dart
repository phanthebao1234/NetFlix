import 'dart:core';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix/core/constants/api_url.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovie();
  Future<Either> getNowplayingMovie();
  Future<Either> getMovieTrailer(int id);
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
}

class MovieApiService extends MovieService {
  @override
  Future<Either> getTrendingMovie() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getNowplayingMovie() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.nowPlayingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getMovieTrailer(int id) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.movie}$id/trailer');
      if (response.data != null) {
        return Right(response.data);
      } else {
        return Left(response.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.response!.data['message'].toString());
    }
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    try {
      var response =
          await sl<DioClient>().get('${ApiUrl.movie}$movieId/recommendations');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    try {
      var response =
          await sl<DioClient>().get('${ApiUrl.movie}$movieId/similar');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
