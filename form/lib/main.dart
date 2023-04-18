import 'package:flutter/material.dart';
import 'package:form/data/db.dart';

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
        '/customer': (context) => HomeScreen(customers: customers),
        '/customer/create-new': (context) => const NewCustomer(),
      },
      initialRoute: '/customer',
    );
  }
}
