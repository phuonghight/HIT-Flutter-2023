import 'package:exam_1/struct/Task.dart';
import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("hello"),
      ),
    );
  }
}
