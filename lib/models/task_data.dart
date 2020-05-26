import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todolist/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  int get tasksCoun {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask({String newTaskName, IconData iconData}) {
    Task newTask = Task(name: newTaskName, isDone: false, icon: iconData);
    _tasks.add(newTask);
    notifyListeners();
  }

  void checkTask({int index}) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void removeTask({int index}) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
