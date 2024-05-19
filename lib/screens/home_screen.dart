import 'package:flutter/material.dart';
import 'package:pos_flutter_project/components/task_list.dart';
import 'package:pos_flutter_project/routes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Lista de Tarefas'),
      ),
      body: const TaskList(),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.task),
              title: const Text('Tarefas'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pushNamed(context, Routes.HOME);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Nova Tarefa'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pushNamed(context, Routes.FORM);
              },
            ),
          ],
        ),
      ),
    );
  }
}
