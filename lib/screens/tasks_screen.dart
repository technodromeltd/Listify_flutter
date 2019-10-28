import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 50.0, left: 30.0, right: 30.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.0,
                      child: Icon(
                        Icons.list,
                        size: 20.0,
                        color: Colors.greenAccent,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                      width: 10.0,
                    ),
                    Text(
                      'Listify',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                  width: 10.0,
                ),
                Text(
                  '${Provider.of<Data>(context).taskCount} tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0))),
              child: TasksList(),
            ),
          ),
          GestureDetector(
            onTap: () {
              Provider.of<Data>(context).removeAllTasks();
            },
            child: Container(
              height: 40.0,
              color: Colors.redAccent.shade100,
              child: Center(
                  child: Text(
                "Clear list",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }
}
