import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/UI/home/category_details/cubit/news_state.dart';
import 'package:news_app/api/api_manger.dart';

class NewsViewModal extends Cubit<NewsState> {
  NewsViewModal() : super(NewsLoadingState());
  void getSourcesBuId(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await ApiManger.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message!));
      } else if (response?.status == 'ok') {
        emit(NewsSuccessState(newsList: response!.articles!));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
