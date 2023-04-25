import 'dart:ffi';

class Meal {
  String id;
  String name;
  double price;
  int sold;
  int likes;
  String? description;
  String imageUrl;

  Meal({
    required this.imageUrl,
    required this.id,
    required this.name,
    required this.price,
    required this.sold,
    required this.likes,
    this.description,
  });
}
