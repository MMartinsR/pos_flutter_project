import 'package:flutter/material.dart';
import 'package:pos_flutter_project/models/task.dart';
import 'package:pos_flutter_project/providers/task_provider.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    final taskProvider = context.watch<TaskProvider>();
    final List<Task>? taskList = taskProvider.tasks;
    Task task = taskList![index];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Detalhes'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(task.name),
            Text(task.date),
            FutureBuilder(
                future: taskProvider.getLocation(),
                builder: (context, snapshot) {
                  return Text(
                      '${snapshot.data?.latitude} ${snapshot.data?.longitude}');
                })
          ],
        ),
      ),
    );
  }
}
