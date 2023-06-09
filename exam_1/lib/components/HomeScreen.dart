import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../data/data.dart';
import '../struct/Task.dart';
import 'TaskPreview.dart';

class HomeScreen extends StatefulWidget {
  late List<Task> list = db;
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Board"),
        actions: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.notifications),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.calendar_month),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        widget.list = db;
                      });
                    },
                    child: const Text(
                      "All",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      widget.list =
                          db.where((element) => !element.isCompleted).toList();
                    });
                  },
                  child: const Text(
                    "Uncompleted",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      widget.list =
                          db.where((element) => element.isCompleted).toList();
                    });
                  },
                  child: const Text(
                    "Completed",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      widget.list =
                          db.where((element) => element.isFavourite).toList();
                    });
                  },
                  child: const Text(
                    "Favourite",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: renderTasks(widget.list),
          )
        ],
      ),
      bottomNavigationBar: directToNewTask(context),
    );
  }

  Padding directToNewTask(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/new-task').then((value) {
            setState(() {});
          });
        },
        child: const Text(
          "Add a task",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }

  Widget renderTasks(List<Task> list) {
    if (list.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return TaskPreview(list[index]);
        },
      );
    } else
      return Center(
        child: Text(
          "No data",
          style: TextStyle(fontSize: 30),
        ),
      );
  }
}
