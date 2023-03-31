import 'package:flutter/material.dart';
import 'package:foody/data/dummy_data.dart';

class Meals extends StatelessWidget {
  final List<Meal> meals;
  const Meals(this.meals, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: const Text("Quick & Easy"),
      ),
      body: MealList(meals),
    );
  }
}

// Category Card Widget
class CategoryCard extends StatelessWidget {
  final Meal meal;
  const CategoryCard(this.meal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              backgroundColor: Colors.white,
              maximumSize: Size(
                  double.infinity, MediaQuery.of(context).size.height * 0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            Navigator.pushNamed(context, '/catogeries/meals/details/',
                arguments: meal.id);
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Column(
              children: [
                // image
                Expanded(
                    child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      meal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    // title
                    Positioned(
                        right: 15,
                        bottom: 25,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 20),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.6)),
                            child: Text(
                              meal.title,
                              style: const TextStyle(fontSize: 20),
                            )))
                  ],
                )),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // duration
                      mealPreview(
                          Icons.watch_later_outlined, meal.duration.toString()),
                      // complexity
                      mealPreview(
                          Icons.work,
                          meal.complexity.toString().substring(
                              meal.complexity.toString().indexOf('.') + 1)),
                      // affordability
                      mealPreview(
                          Icons.attach_money,
                          meal.affordability.toString().substring(
                              meal.affordability.toString().indexOf('.') + 1))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Row mealPreview(IconData icon, String name) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
        ),
        Text(
          name,
          style: const TextStyle(color: Colors.black),
        )
      ],
    );
  }
}

// Rendering Category card from list
class MealList extends StatelessWidget {
  final List<Meal> mealList;
  MealList(this.mealList, {super.key});

  @override
  Widget build(BuildContext context) {
    if (mealList.length == 0) {
      return const Center(
        child: Text(
          "No meals",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
    }
    return ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, index) => CategoryCard(mealList[index]));
  }
}
