import 'package:dartz/dartz.dart';
import 'package:netflix/data/auth/models/signin_req_params.dart';
import 'package:netflix/data/auth/models/signup_req_params.dart';
import 'package:netflix/data/auth/sources/auth_api_service.dart';
import 'package:netflix/domain/auth/repositories/auth.dart';
import 'package:netflix/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  // ignore: empty_constructor_bodies
  @override
  Future<Either> signup(SignupReqParams params) async {
    return await sl<AuthApiService>().signup(params);
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    return await sl<AuthApiService>().signin(params);
  }
}
