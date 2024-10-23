import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_6/model/task_data.dart';
import 'package:review_6/widgets/task_tile.dart';

import '../model/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
