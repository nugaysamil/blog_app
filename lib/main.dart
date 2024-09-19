import 'package:blog_app/feature/views/article_create/article_screen_create.dart';
import 'package:blog_app/feature/views/home/home_screen.dart';
import 'package:blog_app/feature/views/splash/splash_screen.dart';
import 'package:blog_app/product/init/application_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {

  // Initialize the application
  await ApplicationInit().initializeApp();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: SplashScreen(),
    );
  }
}
