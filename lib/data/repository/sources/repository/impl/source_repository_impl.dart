import 'package:news_app/data/repository/sources/data_sources/remote/sourrce_remote_data_source.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';
import 'package:news_app/model/source_response.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;
  SourceRepositoryImpl({required this.remoteDataSource});
  @override
  Future<SourceResponse?> getSources(String categoryId, String applanguage) {
    return remoteDataSource.getSources(categoryId, applanguage);
  }
}
