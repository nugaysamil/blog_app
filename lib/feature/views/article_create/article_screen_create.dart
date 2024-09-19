import 'package:blog_app/feature/views/article_create/mixin/article_screen_create_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleCreate extends ConsumerWidget with ArticleCreateMixin {
  ArticleCreate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Makale Oluştur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey, 
          child: Column(
            children: [
              TextFormField(
                controller: idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Id',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Id boş bırakılamaz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Başlık boş bırakılamaz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: urlController,
                decoration: const InputDecoration(
                  labelText: 'Url',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Url boş bırakılamaz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: thumbnailUrlController,
                decoration: const InputDecoration(
                  labelText: 'thumbnailUrl',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'thumbnailUrl boş bırakılamaz';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (validateForm()) {
                    createArticle(ref, context); 
                  }
                },
                child: const Text('Makale Oluştur'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
