import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/signup.dart';
import 'package:netflix/domain/tv/repositories/tv.dart';
import 'package:netflix/service_locator.dart';

class SearchTvUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<TVRepositories>().searchTVs(params!);
  }
}
