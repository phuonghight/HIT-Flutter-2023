import 'package:flutter/material.dart';
import 'package:foody/Components/meals.dart';
import '../data/dummy_data.dart';

class HomeWidget extends StatefulWidget {
  final List<Category> categories;
  const HomeWidget(this.categories, {super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int screenStatus = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // header
        appBar: AppBar(
          backgroundColor: Colors.pink,
          leading: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.pink)),
            child: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text(screenStatus == 0 ? "Categories" : "Favourite"),
        ),

        // body
        body: screenStatus == 0
            ? const Center(
                child: CategoryList(DUMMY_CATEGORIES),
              )
            : MealList(
                DUMMY_MEALS.where((element) => element.isFavourite).toList()),

        // footer
        bottomNavigationBar: Container(
            height: 70,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: const BoxDecoration(color: Colors.pink),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink),
                      onPressed: () {
                        if (screenStatus == 0) return;
                        screenStatus = 0;
                        setState(() {});
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.category_rounded,
                            color: screenStatus == 0
                                ? Colors.orange
                                : Colors.white,
                          ),
                          Text(
                            "Categories",
                            style: TextStyle(
                                color: screenStatus == 0
                                    ? Colors.orange
                                    : Colors.white),
                          )
                        ],
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink),
                      onPressed: () {
                        if (screenStatus == 1) return;
                        screenStatus = 1;
                        setState(() {});
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: screenStatus == 1
                                ? Colors.orange
                                : Colors.white,
                          ),
                          Text(
                            "Favourite",
                            style: TextStyle(
                                color: screenStatus == 1
                                    ? Colors.orange
                                    : Colors.white),
                          )
                        ],
                      )),
                ]))
        );
  }
}

// ignore: must_be_immutable
class CategoryRouter extends StatelessWidget {
  final Category category;
  const CategoryRouter(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/catogeries/meals/',
              arguments: category.id);
        },
        child: Text(
          category.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

// Rendering category routers from list
class CategoryList extends StatelessWidget {
  final List<Category> list;
  const CategoryList(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: DUMMY_CATEGORIES.length,
      itemBuilder: (_, index) {
        return CategoryRouter(list[index]);
      },
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    );
  }
}
