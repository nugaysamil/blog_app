import 'package:blog_app/feature/models/article_model.dart';
import 'package:blog_app/product/service/article_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final articleServiceProvider = Provider((ref) => ArticleService());

class ArticleNotifier extends StateNotifier<List<ArticleModel>> {
  ArticleNotifier(this._articleService) : super([]);

  final ArticleService _articleService;

  // fetch the articles from the API

  Future<void> fetchArticles() async {
    final articles = await _articleService.fetchArticles();
    state = articles;
  }

  // add the article to the cache
  Future<void> addArticle(ArticleModel newArticle) async {
    state = [...state, newArticle];
    await _articleService.addArticleToCache(newArticle);
  }

  // delete the article from the cache
  Future<void> deleteArticle(int id) async {
    state = state.where((article) => article.id != id).toList();
    await _articleService.deleteArticleFromCache(id);
  }
}

final articleProvider =
    StateNotifierProvider<ArticleNotifier, List<ArticleModel>>((ref) {
  final articleService = ref.watch(articleServiceProvider);
  return ArticleNotifier(articleService);
});
