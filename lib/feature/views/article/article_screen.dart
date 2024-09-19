// ignore_for_file: library_private_types_in_public_api

import 'package:blog_app/feature/views/article_create/article_screen_create.dart';
import 'package:blog_app/feature/views/article_detail/article_detail.dart';
import 'package:blog_app/product/const/string_constant.dart';
import 'package:blog_app/product/riverpod/article_service_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleListPage extends ConsumerStatefulWidget {
  const ArticleListPage({super.key});

  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends ConsumerState<ArticleListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(articleProvider.notifier).fetchArticles());
  }

  @override
  Widget build(BuildContext context) {
    final articles = ref.watch(articleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.articleList),
      ),
      body: articles.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  title: Text(article.title),
                  leading: Image.network(article.thumbnailUrl),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetail(article: article),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArticleCreate()),
          );

          if (result != null) {
            setState(() {
              articles.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
