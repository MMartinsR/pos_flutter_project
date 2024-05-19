import 'package:flutter/material.dart';
import 'package:pos_flutter_project/models/task.dart';
import 'package:pos_flutter_project/providers/task_provider.dart';
import 'package:pos_flutter_project/routes.dart';
import 'package:provider/provider.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    final List<Task>? taskList = taskProvider.tasks;
    Task task = taskList![index];
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.DETAIL,
          arguments: index,
        );
      },
      leading: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.FORM,
              arguments: index,
            );
          },
          child: const Text("Editar")),
      title: Text('Nome: ${task.name}'),
      subtitle: Text('Data: ${task.date}'),
      trailing: ElevatedButton(
          onPressed: () {
            taskProvider.removeTask(task);
          },
          child: const Text("Apagar")),
    );
  }
}
