import 'package:news_app/api/api_manger.dart';
import 'package:news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app/model/new_response.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManger apiManger;
  NewsRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<NewResponse?> getNewsBySourceId(String sourceId) {
    return apiManger.getNewsBySourceId(sourceId);
  }
}
