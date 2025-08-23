import 'package:news_app/api/api_manger.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/sourrce_remote_data_source.dart';
import 'package:news_app/model/source_response.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManger apiManger;
  SourceRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<SourceResponse?> getSources(String categoryId, String applanguage) {
    return apiManger.getSources(categoryId, applanguage);
  }
}
