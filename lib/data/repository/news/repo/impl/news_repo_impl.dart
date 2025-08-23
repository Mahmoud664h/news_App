import 'package:news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app/data/repository/news/repo/news_repo.dart';
import 'package:news_app/model/new_response.dart';

class NewsRepoImpl implements NewsRepo {
  NewsRemoteDataSource remoteDataSource;
  NewsRepoImpl({required this.remoteDataSource});
  @override
  Future<NewResponse?> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
}
