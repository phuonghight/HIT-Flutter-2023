import 'package:flutter/material.dart';
import 'package:shoping_app/data/index.dart';
import 'package:shoping_app/views/HomeScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData myTheme = ThemeData(
      fontFamily: 'Roboto',
      primaryColor: const Color.fromARGB(255, 240, 93, 64),
    );

    return MaterialApp(
      theme: myTheme,
      home: MealList(meals: db),
    );
  }
}
