// ignore_for_file: prefer_const_declarations, avoid_print, unused_local_variable

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newsapp/logic/article_model.dart';

class FunctionalityController extends GetxController {
  // News sections///////////////////
  var topHeadlines = [].obs;
  var businessHeadlines = [].obs;
  var financeHeadLines = [].obs;
  var sportHeadlines = [].obs;
  var techHeadlines = [].obs;
  var entertaintHeadlines = [].obs;
  var healthHeadlines = [].obs;
  var scienceHeadlines = [].obs;

  var isLoading = false.obs;

  var isLoadingHeadlines = false;

  var searchResults = [].obs;

  @override
  void onInit() {
    loadNews();
    super.onInit();
  }

  String constructUrl(String category) {
    return category == "topHeadlines"
        ? "https://newsapi.org/v2/top-headlines?country=za&apiKey=c849fff44b7f434ba1948df7e2f0ebba"
        : "https://newsapi.org/v2/top-headlines?country=za&category=$category&apiKey=c849fff44b7f434ba1948df7e2f0ebba";
  }

  loadLatestNews(String category) async {
    // isLoading(true);
    var response = await http.get(Uri.parse(constructUrl(category)));
    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      var news = News.fromJson(map);

      switch (category) {
        case "topHeadlines":
          topHeadlines.assignAll(news.articles!);
          break;
        case "business":
          businessHeadlines.assignAll(news.articles!);
          break;
        case "sports":
          sportHeadlines.assignAll(news.articles!);
          break;
        case "technology":
          techHeadlines.assignAll(news.articles!);
          break;
        case "health":
          healthHeadlines.assignAll(news.articles!);
          break;
        case "entertainment":
          entertaintHeadlines.assignAll(news.articles!);
          break;

        case "science":
          scienceHeadlines.assignAll(news.articles!);
          break;
      }

      // isLoading(false);
    }
  }

  Future loadNews() async {
    loadLatestNews("topHeadlines");
    loadLatestNews("business");
    loadLatestNews("sports");
    loadLatestNews("technology");
    loadLatestNews("health");
    loadLatestNews("entertainment");
    loadLatestNews("science");
  }

//Weather section
  var defaultCity = "Mthatha".obs;

  loadWeather() async {
    String url =
        "http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=e597df96d9b9eb8101b111904f1bb4d7";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      print(map);
    } else {
      response.body.printError();
    }
  }
}
