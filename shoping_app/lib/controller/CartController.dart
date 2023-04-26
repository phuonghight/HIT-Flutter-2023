import 'package:flutter/material.dart';
import 'package:shoping_app/entity/Meal.dart';
import 'package:shoping_app/entity/MealInCart.dart';

class CartController with ChangeNotifier {
  bool isShowCart = false;

  void hideCartDetailsComponent() {
    isShowCart = false;
    notifyListeners();
  }

  void showCartDetailsComponent() {
    isShowCart = true;
    notifyListeners();
  }

  List<MealInCart> cart = [];

  void addToCart(Meal meal) {
    MealInCart payload = MealInCart(
      id: meal.id,
      meal: meal,
      quantity: 1,
      totalPrice: meal.price,
    );

    int pos = cart.length;

    for (int i = 0; i < cart.length; i++) {
      if (cart[i].meal.id == meal.id) {
        payload = MealInCart(
          id: meal.id,
          meal: meal,
          quantity: cart[i].quantity + 1,
          totalPrice: meal.price * (cart[i].quantity + 1),
        );
        pos = i;
        cart.remove(cart[i]);
        break;
      }
    }

    cart.insert(pos, payload);
    notifyListeners();
  }

  void removeOutCart(Meal meal) {
    for (int i = 0; i < cart.length; i++) {
      if (cart[i].meal.id == meal.id) {
        int newQuantity = cart[i].quantity - 1;
        if (newQuantity > 0) {
          MealInCart newMeal = MealInCart(
            id: cart[i].meal.id,
            meal: meal,
            quantity: newQuantity,
            totalPrice: cart[i].meal.price * newQuantity,
          );
          cart.remove(cart[i]);
          cart.insert(i, newMeal);
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

  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}
