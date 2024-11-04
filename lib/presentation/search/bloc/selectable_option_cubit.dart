import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchType { movie, tv }

class SelectOptionCubit extends Cubit<SearchType> {
  SelectOptionCubit() : super(SearchType.movie);

  void selectMovie() => emit(SearchType.movie);
  void selectTV() => emit(SearchType.tv);
}
