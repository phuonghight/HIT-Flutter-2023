import 'dart:io';

import 'package:flutter/material.dart';

class Task {
  final Color color;
  final String title;
  final Duration startTime;
  final Duration endTime;
  final DateTime deadline;
  bool isFavourite;
  bool isCompleted;

  Task(this.title, this.startTime, this.endTime, this.deadline,
      this.isFavourite, this.isCompleted, this.color);
}
