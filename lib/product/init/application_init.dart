import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';


//Application Initialization
final class ApplicationInit {
  Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Get app document directory
    final appDocumentDir = await getApplicationDocumentsDirectory();
    // Initialize Hive
    await Hive.initFlutter(appDocumentDir.path);
    // Open Hive box
    await Hive.openBox('articlesBox');
  }
}
