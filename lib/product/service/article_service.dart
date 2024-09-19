import 'dart:developer';

import 'package:blog_app/feature/models/article_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class ArticleService {
  final Dio dio = Dio();
  final String apiUrl = 'https://jsonplaceholder.typicode.com/photos';
  Box articlesBox = Hive.box('articlesBox');

  Future<bool> isOnline() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.isNotEmpty && connectivityResult.first != ConnectivityResult.none;
  }
  // store the articles in the cache
  List<ArticleModel> getCachedArticles() {
    final cachedData = articlesBox.get('articles', defaultValue: []);
    return (cachedData as List)
        .map((e) => ArticleModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
    // delete the article from the cache
  Future<void> deleteArticleFromCache(int id) async {
    final cachedData = getCachedArticles();
    final updatedData =
        cachedData.where((article) => article.id != id).toList();

    await articlesBox.put(
        'articles', updatedData.map((e) => e.toJson()).toList());
  }
  // fetch the articles from the API
  Future<List<ArticleModel>> fetchArticles() async {
    try {
      if (await isOnline()) {
        final response = await dio.get(apiUrl);
        if (response.statusCode == 200) {
          final List data = response.data;
          final articles =
              data.take(50).map((e) => ArticleModel.fromJson(e)).toList();
          await articlesBox.put(
              'articles', articles.map((e) => e.toJson()).toList());
          return articles;
        } else {
          throw Exception('Failed Fetch');
        }
      } else {
        return getCachedArticles();
      }
    } catch (e) {
      log('Fetch Error');
      return getCachedArticles();
    }
  }
   // add the article to the cache
  Future<void> addArticleToCache(ArticleModel newArticle) async {
    final cachedData = getCachedArticles();
    final updatedData = [...cachedData, newArticle];

    await articlesBox.put(
        'articles', updatedData.map((e) => e.toJson()).toList());
  }
}
