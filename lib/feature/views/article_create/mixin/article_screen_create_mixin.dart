// ignore_for_file: use_build_context_synchronously

import 'package:blog_app/feature/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blog_app/product/riverpod/article_service_notifier.dart';

mixin ArticleCreateMixin {
  final formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController thumbnailUrlController = TextEditingController();

  Future<void> createArticle(WidgetRef ref, BuildContext context) async
   {
    final newArticle = ArticleModel(
      id: int.parse(idController.text),
      title: titleController.text,
      url: urlController.text,
      thumbnailUrl: thumbnailUrlController.text.isNotEmpty
          ? thumbnailUrlController.text
          : 'https://placekitten.com/200/300',
    );

    await ref.read(articleProvider.notifier).addArticle(newArticle);
    Navigator.pop(context);
  }

  bool validateForm() {
    return formKey.currentState!.validate();
  }
}
