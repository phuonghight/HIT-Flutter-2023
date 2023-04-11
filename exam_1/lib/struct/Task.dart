import 'dart:io';

import 'package:flutter/material.dart';

class Task {
  String title;
  TimeOfDay start;
  TimeOfDay end;
  DateTime deadline;
  Color color;
  bool isFavourite;
  bool isCompleted;

  Task(
    this.title,
    this.deadline,
    this.start, {
    this.end = const TimeOfDay(hour: 23, minute: 59),
    this.color = Colors.pink,
    this.isCompleted = false,
    this.isFavourite = false,
  });
}
