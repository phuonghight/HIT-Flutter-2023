import 'dart:ffi';

import 'package:shoping_app/entity/Meal.dart';

class MealInCart {
  String id;
  Meal meal;
  int quantity;
  double totalPrice;

  MealInCart({
    required this.id,
    required this.meal,
    required this.quantity,
    required this.totalPrice,
  });

  getTotalPrice() {
    return meal.price * quantity;
  }
}
