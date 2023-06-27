import 'package:final_project/core/services/services_locator.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/movies/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}
