import 'package:flutter/material.dart';
import 'package:shoping_app/entity/Meal.dart';
import 'package:shoping_app/entity/MealInCart.dart';

class CartController with ChangeNotifier {
  List<MealInCart> cart = [];

  void addToCart(Meal meal, int quantity) {
    MealInCart payload = MealInCart(
      id: 'abc',
      meal: meal,
      quantity: quantity,
      totalPrice: meal.price * quantity,
    );

    for (int i = 0; i < cart.length; i++) {
      if (cart[i].meal.id == meal.id) {
        payload = MealInCart(
          id: 'abc',
          meal: meal,
          quantity: cart[i].quantity + quantity,
          totalPrice: meal.price * (cart[i].quantity + quantity),
        );
        cart.remove(cart[i]);
        break;
      }
    }

    cart.add(payload);
    notifyListeners();
  }

  void removeOutCart(Meal meal, int quantity) {
    for (int i = 0; i < cart.length; i++) {
      if (cart[i].meal.id == meal.id) {
        int newQuantity = cart[i].quantity - quantity;
        if (newQuantity > 0) {
          MealInCart newMeal = MealInCart(
            id: cart[i].meal.id,
            meal: meal,
            quantity: newQuantity,
            totalPrice: cart[i].meal.price * newQuantity,
          );
          cart.remove(cart[i]);
          cart.add(newMeal);
          break;
        } else {
          cart.remove(cart[i]);
        }
      }
    }
    notifyListeners();
  }

  double get getTotalPrice => cart
      .map((e) => e.totalPrice)
      .fold(0.0, (previousValue, element) => previousValue + element);
}
