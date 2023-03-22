import 'package:exercise_01/ProfileUserPage.dart';
import 'package:flutter/material.dart';

import 'BankingApp.dart';
import 'ProfileUserPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: ProfileUserPage(),
    ));
  }
}
