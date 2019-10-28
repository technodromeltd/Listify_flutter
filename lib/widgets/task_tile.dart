import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:swipedetector/swipedetector.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final int taskIndex;

  TaskTile({this.isChecked, this.taskTitle, this.taskIndex});

  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      onSwipeLeft: () {
        Provider.of<Data>(context).removeTask(taskIndex);
      },
      swipeConfiguration: SwipeConfiguration(
        horizontalSwipeMaxHeightThreshold: 50.0,
        horizontalSwipeMinDisplacement: 30.0,
        horizontalSwipeMinVelocity: 100.0,
      ),
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            activeColor: Colors.green,
            value: isChecked,
            onChanged: (val) {
              Provider.of<Data>(context).toggleCheckbox(taskIndex);
            }),
      ),
    );
  }
}
