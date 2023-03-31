import 'package:flutter/material.dart';
import 'package:foody/data/dummy_data.dart';

class MealDetails extends StatelessWidget {
  Meal meal;
  MealDetails(this.meal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: Text(meal.title),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // image
                  Image.network(meal.imageUrl, height: 250, fit: BoxFit.cover),
                  // ingredients
                  ingredients(meal),
                  // steps
                  Column(
                    children: [
                      const Text(
                        "Steps",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      steps(meal),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // add to favourite
          AddToFavourite(meal),
        ],
      ),
    );
  }

  // steps
  ListView steps(Meal meal) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: meal.steps.length,
      itemBuilder: (_, index) => Container(
        padding:
            const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
        decoration: const BoxDecoration(

            /// tôi chịu ông :))
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.5)))),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text('# ${index + 1}'),
            ),
          ),
          Expanded(
            child: Text(meal.steps[index],
                style: const TextStyle(fontWeight: FontWeight.w500)),
          )
        ]),
      ),
    );
  }

  // ingredients
  Padding ingredients(Meal meal) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "Ingredients",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: meal.ingredients.length,
              itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.only(top: 7),
                  padding: const EdgeInsets.only(left: 10, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.yellow),
                  child: Text(
                    meal.ingredients[index],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )),
            ),
          ],
        ));
  }
}

class AddToFavourite extends StatefulWidget {
  Meal meal;
  AddToFavourite(
    this.meal, {
    super.key,
  });

  @override
  State<AddToFavourite> createState() => AddToFavouriteState();
}

class AddToFavouriteState extends State<AddToFavourite> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        right: 20,
        child: InkWell(
          onTap: () {
            widget.meal.isFavourite = !widget.meal.isFavourite;
            setState(() {});
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                color: Colors.yellow, shape: BoxShape.circle),
            child: Icon(widget.meal.isFavourite
                ? Icons.star
                : Icons.star_outline_rounded),
          ),
        ));
  }
}
