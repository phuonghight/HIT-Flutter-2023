import 'package:flutter/material.dart';

import 'ProfileUserPage.dart';
import 'BankingApp.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: BankingApp(),
    ));
  }
}
