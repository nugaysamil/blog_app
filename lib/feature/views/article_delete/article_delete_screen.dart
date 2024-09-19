import 'package:blog_app/product/riverpod/article_service_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleDelete extends ConsumerWidget {
  const ArticleDelete({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Makale Sil'),
      ),
      body: articles.isEmpty
          ? const Center(child: Text('Hiç makale bulunamadı'))
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  title: Text(article.title),
                  leading: Image.network(article.thumbnailUrl),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await ref
                          .read(articleProvider.notifier)
                          .deleteArticle(article.id);
                    },
                  ),
                );
              },
            ),
    );
  }
}
