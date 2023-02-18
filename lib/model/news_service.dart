import 'dart:io';

import 'package:dio/dio.dart';
import 'package:newsapp/model/data_model/news_model.dart';

class NewsService {
  final _dio = Dio();
  final _url =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=c9230c1bef5b4c5187348725897833cf';

  Future<NewsModel?> getNewsApi() async {
    Response response = await _dio.get(_url);
    if (response.statusCode == HttpStatus.ok) {
      // print(response.data['articles'][0]['title']);
      NewsModel? model = NewsModel.fromJson(response.data);
      return model;
    }
    return null;
  }
}
