import 'package:flutter/material.dart';
import 'package:pos_flutter_project/components/task_form.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: const Text('Tarefa'),
    );

    return Scaffold(
      appBar: appBar,
      body: TaskForm(),
    );
  }
}
