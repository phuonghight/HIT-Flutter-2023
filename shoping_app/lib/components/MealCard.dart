import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Container(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal.name,
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
                          print('minus');
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
                      width: 50,
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
                          print('plus');
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
          )
        ],
      ),
    );
  }
}
