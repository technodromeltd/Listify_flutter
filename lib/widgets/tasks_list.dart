import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, child) {
        return ListView.builder(
            itemCount: data.taskCount + 1,
            itemBuilder: (context, index) {
              if (index == data.taskCount) {
                return Container(
                    padding: EdgeInsets.only(left: 20.0, right: 160.0),
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      onSubmitted: (val) {
                        if (val != null) {
                          Provider.of<Data>(context).addTask(val);
                        }
                      },
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          hintText: 'Add new task',
                          hintStyle: TextStyle(color: Colors.grey.shade200)),
                    ));
              }
              return TaskTile(
                taskTitle: data.tasks[index].name,
                isChecked: data.tasks[index].isDone,
                taskIndex: index,
              );
            });
      },
    );
  }
}
