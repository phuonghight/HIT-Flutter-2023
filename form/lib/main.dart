import 'package:flutter/material.dart';
import 'package:form/views/HomeScreen.dart';
import 'package:form/views/NewCustomer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/customer': (context) => HomeScreen(),
        '/customer/create-new': (context) => NewCustomer(),
      },
      initialRoute: '/customer',
    );
  }
}
