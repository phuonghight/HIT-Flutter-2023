import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/components/CartDetails.dart';
import 'package:shoping_app/components/CartFotter.dart';
import 'package:shoping_app/components/MealCard.dart';
import 'package:shoping_app/controller/CartController.dart';
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
  bool isShowCart = false;
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
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: target.length,
            itemBuilder: (context, index) => MealCard(
              meal: target[index],
            ),
          ),
          if (context.watch<CartController>().isShowCart) const CartDetails(),
        ],
      ),
      bottomNavigationBar: const CartFotter(),
    );
  }
}
