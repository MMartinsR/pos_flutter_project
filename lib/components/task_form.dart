import 'package:flutter/material.dart';
import 'package:pos_flutter_project/providers/task_provider.dart';
import 'package:pos_flutter_project_pk/pos_flutter_project_pk.dart';
import 'package:provider/provider.dart';

class TaskForm extends StatelessWidget {
  TaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    // final List<Task> taskList = taskProvider.tasks;
    // final addNewTask = taskProvider.addTask;
    // final editTask = taskProvider.editTask;
    // final int index = ModalRoute.of(context)!.settings.arguments as int;
    // final Task task = taskList[index];
    // final bool isEditing = task != null;

    // Firestore persistence
    final insert = taskProvider.insert;

    final TextEditingController nameController = TextEditingController();
    final TextEditingController dateController = TextEditingController();

    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Nome'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              controller: dateController,
              decoration: const InputDecoration(hintText: 'Data (dd-mm-aaaa) '),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String name = nameController.text;
              String date = dateController.text;

              final task = Task(name, date);

              // if (isEditing) {
              //   editTask(task, index);
              // } else {
              // addNewTask(task);
              insert(task);
              Navigator.of(context).pop();
              // }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
