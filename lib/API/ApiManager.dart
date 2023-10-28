import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/NewsResponse/NewsResponse.dart';
import 'package:news_app/SourcesResponse/SourcesResponse.dart';
class ApiManager{
  static const baseUrl = 'newsapi.org';
  static const apiKey = "519e3571f24542e787f196a7983a765d";
  static Future<SourcesResponse> getSources(String categoryId)async{
    var uri = Uri.https(baseUrl,'v2/top-headlines/sources',
    {
      "apiKey":apiKey,
      "category":categoryId
    }
    );
   var response =  await http.get(uri);
   var json = jsonDecode(response.body);
   var sourcesResponse = SourcesResponse.fromJson(json);
   return sourcesResponse;
  }
  static Future<NewsResponse> getNews(String sourceId)async{
    var uri = Uri.https(baseUrl,'v2/everything',
    {
      "apiKey":apiKey,
      "sources":sourceId
    }
    );
   var response =  await http.get(uri);
   var json = jsonDecode(response.body);
   var sourcesResponse = NewsResponse.fromJson(json);
   return sourcesResponse;
  }

}