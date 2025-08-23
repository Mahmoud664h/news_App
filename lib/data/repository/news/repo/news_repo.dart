import 'package:news_app/model/new_response.dart';

abstract class NewsRepo {
  Future<NewResponse?> getNewsBySourceId(String sourceId);
}
