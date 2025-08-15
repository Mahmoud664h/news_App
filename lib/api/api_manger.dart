import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/new_response.dart';
import 'package:news_app/model/source_response.dart';

class ApiManger {
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=15f8125729ee4a0ca6a328779282b619
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=15f8125729ee4a0ca6a328779282b619
  */

  static Future<SourceResponse?> getSources(
    String categoryId,
    String applanguage,
  ) async {
    Uri uri = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
      'language': applanguage,
    });

    try {
      var response = await http.get(uri);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
