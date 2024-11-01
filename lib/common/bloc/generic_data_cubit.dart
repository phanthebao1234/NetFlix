import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/bloc/generic_data_state.dart';
import 'package:netflix/core/usecase/signup.dart';


class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());

  Future<void> getData<T>(UseCase usecase, {dynamic params}) async {
    var returnedData = await usecase.call(params: params);

    returnedData.fold((error) {
      emit(FailureLoadData(errorMessage: error));
    }, (data) {
      emit(DataLoaded<T>(data: data));
    });
  }
}
