import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.taskCount,
        itemBuilder: (BuildContext context, index) {
          final task = taskData.tasks[index];

          return TaskTile(
            title: task.name,
            isChecked: task.isDone,
            checkboxCallback: (checkedState) =>
                taskData.checkSelectedTask(task),
            longPressCallback: () => taskData.deleteTask(task),
          );
        },
      );
    });
  }
}
