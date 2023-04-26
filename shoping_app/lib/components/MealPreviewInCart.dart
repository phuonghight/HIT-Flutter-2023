import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/controller/CartController.dart';
import 'package:shoping_app/entity/Meal.dart';
import 'package:shoping_app/utils/formatPrice.dart';

// ignore: must_be_immutable
class MealPreviewInCart extends StatelessWidget {
  Meal meal;
  int quantity;
  MealPreviewInCart({super.key, required this.meal, required this.quantity});

  @override
  Widget build(BuildContext context) {
    TextEditingController quantityControllor = TextEditingController();
    GlobalKey formKey = GlobalKey<State>();

    quantityControllor.text = quantity.toString();
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
              width: 70,
              height: 70,
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
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                controller: quantityControllor,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
