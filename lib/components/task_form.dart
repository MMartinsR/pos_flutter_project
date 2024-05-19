import 'package:flutter/material.dart';
import 'package:pos_flutter_project/models/task.dart';
import 'package:pos_flutter_project/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskForm extends StatelessWidget {
  TaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    final List<Task>? taskList = taskProvider.tasks;
    final addNewTask = taskProvider.addTask;
    final editTask = taskProvider.editTask;
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    final Task task = taskList![index];
    final bool isEditing = task != null;

    final TextEditingController nameController =
        TextEditingController(text: task?.name ?? '');
    final TextEditingController dateController =
        TextEditingController(text: task?.date ?? '');

    return SizedBox(
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'Nome: '),
          ),
          TextField(
            controller: dateController,
            decoration: const InputDecoration(hintText: 'Data (dd-mm-aaaa): '),
          ),
          ElevatedButton(
            onPressed: () {
              String name = nameController.text;
              String date = dateController.text;

              final task = Task(name, date);

              if (isEditing) {
                editTask(task, index);
              } else {
                addNewTask(task);
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
