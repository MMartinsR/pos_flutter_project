import 'package:flutter/material.dart';

import 'package:pos_flutter_project/providers/task_provider.dart';
import 'package:pos_flutter_project/routes.dart';
import 'package:pos_flutter_project_pk/pos_flutter_project_pk.dart';
import 'package:provider/provider.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    // final List<Task> taskList = taskProvider.tasks;
    // Task task = taskList[index];
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.DETAIL,
          arguments: task,
        );
      },
      // leading: IconButton(
      //     onPressed: () {
      //       Navigator.pushNamed(
      //         context,
      //         Routes.FORM,
      //         arguments: task.id,
      //       );
      //     },
      //     icon: const Icon(Icons.edit)),
      title: Text('Nome: ${task.name}'),
      subtitle: Text('Data: ${task.date}'),
      trailing: IconButton(
          onPressed: () {
            // taskProvider.removeTask(task);
            taskProvider.delete(task);
          },
          icon: const Icon(Icons.delete)),
    );
  }
}
