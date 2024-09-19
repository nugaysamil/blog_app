// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks

import 'dart:async';

import 'package:blog_app/feature/views/home/home_screen.dart';
import 'package:flutter/material.dart';

mixin SplashScreenMixin {

  
  Future<void> navigationToHomeScreen(BuildContext context) async {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    });
  }
}
