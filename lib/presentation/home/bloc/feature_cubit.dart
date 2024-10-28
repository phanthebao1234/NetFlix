import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/movie_kkphim/usecases/getFeatureMovies.dart';
import 'package:netflix/presentation/home/bloc/feature_state.dart';
import 'package:netflix/service_locator.dart';

class FeatureCubit extends Cubit<FeatureState> {
  FeatureCubit() : super(FeatureMoviesLoading());

  Future<void> getfeatureMovies() async {
    var returnedData = await sl<GetFeatureMoviesUseCase>().call();

    returnedData.fold((error) {
      emit(FailureLoadFeatureMovies(errorMessage: error));
    }, (data) {
      emit(FeatureMoviesLoaded(movies: data));
    });
  }
}
