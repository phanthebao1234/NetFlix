import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchType { moive, tv }

class SelectOptionCubit extends Cubit<SearchType> {
  SelectOptionCubit() : super(SearchType.moive);

  void selectMovie() => emit(SearchType.moive);
  void selectTV() => emit(SearchType.tv);
}
