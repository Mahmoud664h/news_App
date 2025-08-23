import 'package:news_app/model/new_response.dart';

abstract class NewsRemoteDataSource {
  Future<NewResponse?> getNewsBySourceId(String sourceId);
}
