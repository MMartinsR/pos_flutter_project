import 'package:flutter/material.dart';
import 'package:pos_flutter_project/components/task_list_tile.dart';
import 'package:pos_flutter_project/providers/task_provider.dart';
import 'package:pos_flutter_project_pk/pos_flutter_project_pk.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    final List<Task> taskList = taskProvider.tasks;

    if (taskList.isEmpty) {
      taskProvider.list();
    }

    return ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          Task task = taskList[index];
          // return TaskListTile(index: index);
          return TaskListTile(task: task);
        });
  }
}
