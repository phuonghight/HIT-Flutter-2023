import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/components/CartFotter.dart';
import 'package:shoping_app/entity/Meal.dart';

import '../components/CartDetails.dart';
import '../controller/CartController.dart';
import '../utils/formatPrice.dart';

class MealDetails extends StatelessWidget {
  Meal meal;
  MealDetails({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CartFotter(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                meal.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatPriceToString(meal.price),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Form(
                          // key: formKey,
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
                                    context
                                        .read<CartController>()
                                        .removeOutCart(
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

                              const SizedBox(
                                width: 20,
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
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
          ),
          if (context.watch<CartController>().isShowCart) const CartDetails(),
        ],
      ),
    );
  }
}
