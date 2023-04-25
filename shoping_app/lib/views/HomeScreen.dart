import 'package:flutter/material.dart';
import 'package:shoping_app/components/MealCard.dart';
import 'package:shoping_app/entity/Meal.dart';

class MealList extends StatelessWidget {
  List<Meal> meals;
  MealList({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
        title: TextFormField(
          decoration: InputDecoration(
            hintText: 'Tìm kiếm món ăn',
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.reply_outlined,
            ),
          )
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: meals.length,
        itemBuilder: (context, index) => MealCard(
          meal: meals[index],
        ),
      ),
    );
  }
}
