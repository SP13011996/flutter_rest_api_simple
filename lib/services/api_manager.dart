import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_rest_api/constants/strings.dart';
import 'package:news_rest_api/models/newsinfo.dart';

class API_Manager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var response = await client.get(Uri.parse(Strings.news_url));
    var newsModel = null;

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
