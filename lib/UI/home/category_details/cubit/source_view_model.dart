import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/UI/home/category_details/cubit/source_state.dart';
import 'package:news_app/api/api_manger.dart';

class SourceViewModel extends Cubit<SourcesState> {
  SourceViewModel() : super(SourceLoadingState());
  void getSources(String categoryId, String applanguage) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManger.getSources(categoryId, applanguage);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message!));
      } else if (response?.status == 'ok') {
        emit(SourceSuccessState(sourcesList: response!.sources!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
