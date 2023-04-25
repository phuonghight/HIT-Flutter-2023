import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoping_app/controller/CartController.dart';
import 'package:shoping_app/data/index.dart';
import 'package:shoping_app/views/HomeScreen.dart';
import 'package:shoping_app/views/MealDetails.dart';
import 'entity/Meal.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartController(),
        ),
      ],
      child: const MainApp(),
    ),
  );
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
      routes: {
        '/meals': (context) => MealList(meals: db),
        '/meal/details/:id': (context) => MealDetails(meal: db[0]),
      },
      onGenerateRoute: (settings) {
        if (settings.name!.contains('/meal/details/')) {
          Meal? meal = db.firstWhere(
            (element) => element.id == settings.arguments,
          );
          return MaterialPageRoute(
            builder: (context) => MealDetails(meal: meal),
          );
        }
      },
      // initialRoute: '/meals',
      home: MealList(meals: db),
    );
  }
}
