import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/movie/usecases/get_similar_movies.dart';
import 'package:netflix/presentation/watch/bloc/similar_movie_state.dart';
import 'package:netflix/service_locator.dart';

class SimilarMovieCubit extends Cubit<SimilarMovieState> {
  SimilarMovieCubit() : super(SimilarMovieLoading());

  Future<void> getSimilarMovie(int movieId) async {
    var returnedData =
        await sl<GetSimilarMovieUseCase>().call(params: movieId);

    returnedData.fold(
      (error) {
        emit(FailureLoadSimilarMovie(errorMessage: error)) ;
      },
      (data) {
        emit(SimilarMovieLoaded(movies: data));
      },
    );
  }
}
