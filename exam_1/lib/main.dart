import 'package:exam_1/components/HomeScreen.dart';
import 'package:exam_1/components/NewTask.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/new-task': (BuildContext context) => NewTask(),
        '/': (context) => HomeScreen()
      },
      initialRoute: '/',
    );
  }
}
