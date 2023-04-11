import 'package:flutter/material.dart';
import 'package:exam_1/struct/Task.dart';

List<Task> db = [
  Task("Task 1", DateTime(2023, 4, 30), TimeOfDay.now(), color: Colors.red),
  Task("Task 2", DateTime(2023, 5, 1), TimeOfDay.now(), color: Colors.blue),
];
