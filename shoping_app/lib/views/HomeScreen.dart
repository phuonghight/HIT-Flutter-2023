import 'package:flutter/material.dart';
import 'package:shoping_app/components/CartComponent.dart';
import 'package:shoping_app/components/MealCard.dart';
import 'package:shoping_app/entity/Meal.dart';

// ignore: must_be_immutable
class MealList extends StatefulWidget {
  List<Meal> meals;
  MealList({super.key, required this.meals});

  @override
  State<MealList> createState() => _MealListState();
}

class _MealListState extends State<MealList> {
  late List<Meal> target = widget.meals;
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
          onChanged: (value) {
            target = widget.meals
                .where((element) =>
                    element.name.toLowerCase().contains(value.toLowerCase()))
                .toList();
            setState(() {});
          },
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
        itemCount: target.length,
        itemBuilder: (context, index) => MealCard(
          meal: target[index],
        ),
      ),
      bottomNavigationBar: CartComponent(),
    );
  }
}
