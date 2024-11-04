import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/movie/usecases/search_movie.dart';
import 'package:netflix/domain/tv/usecases/search_tv.dart';
import 'package:netflix/presentation/search/bloc/search_state.dart';
import 'package:netflix/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:netflix/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final TextEditingController textEditingController = TextEditingController();

  void search(String query, SearchType searchType) {
    if (query.isNotEmpty) {
      emit(SearchLoading());

      switch (searchType) {
        case SearchType.movie:
          searchMovie(query);
          break;
        case SearchType.tv:
          searchTV(query);
          break;
      }
    }
  }

  Future<void> searchMovie(String query) async {
    var returnedData = await sl<SearchMovieUseCase>().call(params: query);

    returnedData.fold((error) {
      emit(SearchFailure(errorMessage: error));
    }, (data) {
      emit(MovieLoaded(movie: data));
    });
  }

  Future<void> searchTV(String query) async {
    var returnedData = await sl<SearchTvUseCase>().call(params: query);
    returnedData.fold((error) {
      emit(SearchFailure(errorMessage: error));
    }, (data) {
      print('******************data**********************');
      print(data);
      print('**********************data******************');

      emit(TVLoaded(tv: data));
    });
  }
}
