import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix/core/constants/api_url.dart';
import 'package:netflix/core/network/dio_client_kkphim.dart';
import 'package:netflix/service_locator.dart';

abstract class KKMovieService {
  Future<Either> getFeaturedMovie();
}

class KKMovieApiServiceImpl extends KKMovieService {
  @override
  Future<Either> getFeaturedMovie() async {
    try {
      var response = await sl<DioClientKKPhim>().get(ApiUrl.featureMovie);
      print('*****************************************');
      print(response.data['data']['items']);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
