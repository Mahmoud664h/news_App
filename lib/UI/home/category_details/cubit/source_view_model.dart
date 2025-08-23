import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/UI/home/category_details/cubit/source_state.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';

class SourceViewModel extends Cubit<SourcesState> {
  SourceRepository sourceRepository;
  SourceViewModel({required this.sourceRepository})
    : super(SourceLoadingState());
  void getSources(String categoryId, String applanguage) async {
    try {
      emit(SourceLoadingState());
      var response = await sourceRepository.getSources(categoryId, applanguage);
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
