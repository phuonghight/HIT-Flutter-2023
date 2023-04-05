import 'package:flutter/material.dart';
import 'package:exam_1/struct/Task.dart';

List<Task> db = [
  Task(
      "Task 1",
      Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute),
      const Duration(hours: 22, minutes: 0),
      DateTime(2023, 04, 06),
      false,
      false,
      Colors.red),
  Task(
      "Task 2",
      Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute),
      const Duration(hours: 22, minutes: 0),
      DateTime(2023, 04, 06),
      false,
      false,
      Colors.blue),
];
