import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:netflix/presentation/home/bloc/now_playing_state.dart';
import 'package:netflix/service_locator.dart';

class PopularTVCubit extends Cubit<NowPlayingState> {
  PopularTVCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async {
    var returnedData = await sl<GetNowPlayingMoviesUseCase>().call();
    returnedData.fold((error) {
      emit(FailureLoadNowPlayingMovies(errorMessage: error));
    }, (data) {
      emit(NowPlayingLoaded(movies: data));
    });
  }

}
