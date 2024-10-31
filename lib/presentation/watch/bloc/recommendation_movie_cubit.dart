import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/movie/usecases/get_recommend_movie.dart';
import 'package:netflix/presentation/watch/bloc/recommendation_movie_state.dart';
import 'package:netflix/service_locator.dart';

class SimilarMovieCubit extends Cubit<RecommendationMovieState> {
  SimilarMovieCubit() : super(RecommendationMovieLoading());

  Future<void> getRecommendationMovie(int movieId) async {
    var returnedData =
        await sl<GetRecommendMovieUseCase>().call(params: movieId);

    returnedData.fold(
      (error) {
        emit(FailureLoadRecommendationMovie(errorMessage: error));
      },
      (data) {
        emit(RecommendationMovieLoaded(movies: data));
      },
    );
  }
}
