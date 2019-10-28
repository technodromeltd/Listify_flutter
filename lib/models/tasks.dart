import 'package:flutter/foundation.dart';
import 'dart:collection';

class Data extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Bread'),
    Task(name: 'Buy milk'),
    Task(name: 'Vacuum'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTask) {
    _tasks.add(Task(name: newTask));
    notifyListeners();
  }

  void removeTask(int taskIndex) {
    print('trying to delete at $taskIndex ${_tasks[taskIndex].name}');
    _tasks.removeAt(taskIndex);
    notifyListeners();
  }

  void removeAllTasks() {
    print("Clearing list");
    _tasks = [];
    notifyListeners();
  }

  void toggleCheckbox(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;

    notifyListeners();
  }
}

class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggleDone() {
    isDone != isDone;
  }
}
