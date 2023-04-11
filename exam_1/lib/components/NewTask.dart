import 'dart:math';

import 'package:exam_1/data/data.dart';
import 'package:exam_1/struct/Task.dart';
import 'package:exam_1/utils/date-format.dart';
import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  late String title;
  late DateTime deadline;
  TimeOfDay start = TimeOfDay.now();
  TimeOfDay end = const TimeOfDay(hour: 23, minute: 59);
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add task'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.chevron_left_rounded)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
          child: Column(
            children: [
              // Title
              SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: ('Design team meeting'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else
                          return null;
                      },
                      onChanged: (value) {
                        title = value;
                      },
                    )
                  ],
                ),
              ),

              // Deadline
              SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Deadline',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // InputDatePickerFormField(
                    //   firstDate: DateTime(2023),
                    //   lastDate: DateTime(2030),
                    //   initialDate: DateTime.now(),
                    //   onDateSubmitted: (value) {
                    //     print(value.toIso8601String());
                    //   },
                    // ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black12,
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                      ),
                      onPressed: () {
                        _selectDate(context);
                        deadline = _dateTime;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatDate(_dateTime),
                          ),
                          const Icon(Icons.calendar_month)
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Start - End time
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Start Time',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black12,
                              padding:
                                  const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            ),
                            onPressed: () {
                              _selectTime(context, 'start');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${start.hour}:${start.minute}'),
                                const Icon(Icons.watch_later_outlined)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'End Time',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black12,
                              padding:
                                  const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            ),
                            onPressed: () {
                              _selectTime(context, 'end');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${end.hour}:${end.minute}'),
                                const Icon(Icons.watch_later_outlined)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Color
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Color',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _selectColor(target: Colors.red),
                        _selectColor(target: Colors.yellow),
                        _selectColor(target: Colors.green),
                        _selectColor(),
                        _selectColor(target: Colors.purple)
                      ],
                    )
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  onPressed: () {
                    Task newTask =
                        Task(title, deadline, start, end: end, color: color);
                    db.add(newTask);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // select color
  ElevatedButton _selectColor({Color target = Colors.blue}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: target,
      ),
      onPressed: () {
        color = target;
      },
      child: const SizedBox(
        height: 75,
        width: 50,
      ),
    );
  }

  // Select time: hour and minute form button
  Future<void> _selectTime(BuildContext context, String type) async {
    final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: start,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        });
    if (newTime != null) {
      setState(() {
        if (type == 'start') {
          start = newTime;
        } else if (type == 'end') {
          end = newTime;
        }
      });
    }
  }

  // Select date: date-moth-year
  DateTime _dateTime = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );

    if (newDate != null && newDate != _dateTime) {
      setState(() {
        _dateTime = newDate;
      });
    }
  }
}
