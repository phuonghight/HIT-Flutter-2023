import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/controller/CartController.dart';
import 'package:shoping_app/entity/Meal.dart';
import 'package:shoping_app/utils/formatPrice.dart';

// ignore: must_be_immutable
class MealCard extends StatelessWidget {
  Meal meal;
  TextEditingController quantity = TextEditingController();
  GlobalKey formKey = GlobalKey<State>();
  MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    quantity.text = '1';
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/meal/details/',
          arguments: meal.id,
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.grey.shade300,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              meal.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${meal.sold} đã bán',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('|'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${meal.likes} lượt thích',
                      ),
                    ],
                  ),
                  Text(
                    formatPriceToString(meal.price),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Row(
                      children: [
                        // button minus one
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).primaryColor,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              context.read<CartController>().removeOutCart(
                                    meal,
                                  );
                            },
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                            ),
                          ),
                        ),

                        // input quantity
                        SizedBox(
                          width: 30,
                          child: TextFormField(
                            controller: quantity,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '$quantity',
                            ),
                          ),
                        ),

                        // button plus one
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              context.read<CartController>().addToCart(
                                    meal,
                                  );
                            },
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
