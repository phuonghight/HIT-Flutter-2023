import 'package:flutter/material.dart';
import 'package:foody/Components/meal_details.dart';
import 'package:foody/Components/meals.dart';
import 'package:foody/Components/categories.dart';
import 'package:foody/data/dummy_data.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/catogeries': (context) => HomeWidget(DUMMY_CATEGORIES),
        '/catogeries/meals/:id': (context) => const Meals([]),
        '/catogeries/meals/details/:id': (context) =>
            MealDetails(DUMMY_MEALS[0])
      },
      onGenerateRoute: (settings) {
        var myRouter;
        if (settings.name == "/catogeries/meals/") {
          List<Meal> meals = DUMMY_MEALS
              .where(
                  (element) => element.categories.contains(settings.arguments))
              .toList();
          myRouter = MaterialPageRoute(
            builder: (context) => Meals(meals),
          );
        } else if (settings.name == "/catogeries/meals/details/") {
          late Meal meal;
          for (var element in DUMMY_MEALS) {
            if (element.id == settings.arguments) meal = element;
          }
          myRouter = MaterialPageRoute(
            builder: (context) => MealDetails(meal),
          );
        }
        return myRouter;
      },
      initialRoute: '/catogeries',
      // home: Meals(DUMMY_MEALS),
      // home: MealDetails(DUMMY_MEALS[5]),
    );
  }
}
