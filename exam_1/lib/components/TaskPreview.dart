import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:exam_1/struct/Task.dart';
import 'package:flutter/widgets.dart';

import '../utils/date-format.dart';

class TaskPreview extends StatefulWidget {
  Task task;
  TaskPreview(this.task, {super.key});

  @override
  State<TaskPreview> createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration: BoxDecoration(
        color: widget.task.color,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: ListTile(
        leading: Checkbox(
          activeColor: Colors.green,
          shape: const CircleBorder(),
          value: widget.task.isCompleted,
          onChanged: (newValue) {
            setState(
              () {
                widget.task.isCompleted =
                    widget.task.isCompleted ? false : true;
              },
            );
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.title,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
                'From: ${formatTimeOfDay(widget.task.start)} - To: ${formatTimeOfDay(widget.task.end)}'),
            Text('Deadline: ${formatDate(widget.task.deadline)}')
          ],
        ),
        // trailing: Checkbox(
        //   value: widget.task.isFavourite,
        //   onChanged: (value) {
        //     setState(() {
        //       widget.task.isFavourite = widget.task.isFavourite ? false : true;
        //     });
        //   },
        // ),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              widget.task.isFavourite = widget.task.isFavourite ? false : true;
            });
          },
          icon: widget.task.isFavourite
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}
