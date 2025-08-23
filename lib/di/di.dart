import 'package:news_app/api/api_manger.dart';
import 'package:news_app/data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart';
import 'package:news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app/data/repository/news/repo/impl/news_repo_impl.dart';
import 'package:news_app/data/repository/news/repo/news_repo.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/sourrce_remote_data_source.dart';
import 'package:news_app/data/repository/sources/repository/impl/source_repository_impl.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';

ApiManger injectApiManger() {
  return ApiManger();
}

SourceRepository injectSourceRepository() {
  return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource());
}

SourceRemoteDataSource injectSourceRemoteDataSource() {
  return SourceRemoteDataSourceImpl(apiManger: injectApiManger());
}

NewsRepo injectNewsRepo() {
  return NewsRepoImpl(remoteDataSource: injectNewsRemoteDataSource());
}

NewsRemoteDataSource injectNewsRemoteDataSource() {
  return NewsRemoteDataSourceImpl(apiManger: injectApiManger());
}
