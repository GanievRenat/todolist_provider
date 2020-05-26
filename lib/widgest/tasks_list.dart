import 'package:flutter/material.dart';
import 'package:todolist/widgest/task_title.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskDatd, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTitle(
              name: taskDatd.tasks[index].name,
              isChecked: taskDatd.tasks[index].isDone,
              icon: taskDatd.tasks[index].icon,
              chackBoxCallback: (value) {
                taskDatd.checkTask(index: index);
              },
              longClick: () {
                taskDatd.removeTask(index: index);
              },
            );
          },
          itemCount: taskDatd.tasksCoun,
        );
      },
    );
  }
}
