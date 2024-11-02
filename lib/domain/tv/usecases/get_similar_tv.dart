import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/signup.dart';
import 'package:netflix/domain/tv/repositories/tv.dart';
import 'package:netflix/service_locator.dart';

class GetSimilarTVUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<TVRepositories>().getSimilarTvs(params!);
  }
}
