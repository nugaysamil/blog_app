import 'package:blog_app/feature/views/article/article_screen.dart';
import 'package:blog_app/feature/views/article_create/article_screen_create.dart';
import 'package:blog_app/feature/views/article_delete/article_delete_screen.dart';
import 'package:blog_app/product/const/string_constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _HomeAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ArticleListPage(),
              )),
              child: const Text(StringConstant.article),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ArticleCreate(),
              )),
              child: const Text(StringConstant.articleCreate),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ArticleDelete(),
              )),
              child: const Text(StringConstant.articleDelete),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _HomeAppBar() {
    return AppBar(
      title: const Text(
        'Blog App',
      ),
    );
  }
}
