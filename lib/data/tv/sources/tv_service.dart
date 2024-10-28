import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix/core/constants/api_url.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/service_locator.dart';

abstract class TVService {
  Future<Either> getPopularTV();
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
  
}
