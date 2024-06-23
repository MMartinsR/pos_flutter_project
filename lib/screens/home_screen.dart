import 'package:flutter/material.dart';
import 'package:pos_flutter_project/components/drawer_menu.dart';
import 'package:pos_flutter_project/components/task_list.dart';

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
      drawer: DrawerMenu(),
    );
  }
}
