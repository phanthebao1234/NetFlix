import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/movie/usecases/get_trending.dart';
import 'package:netflix/presentation/home/bloc/trending_state.dart';
import 'package:netflix/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit(super.initialState);

  void getTrendingMovies() async {
    var returneddata = await sl<GetTrendingMoviesUseCase>().call();
    returneddata.fold((error) {
      emit(FailureLoadTrendingMovies(errorMessage: error));
    }, (data) {
      emit(TrendingMoviesLoaded(movies: data));
    });
  }
}
