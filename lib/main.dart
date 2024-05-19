import 'package:flutter/material.dart';
import 'package:pos_flutter_project/providers/task_provider.dart';
import 'package:pos_flutter_project/routes.dart';
import 'package:pos_flutter_project/screens/details_screen.dart';
import 'package:pos_flutter_project/screens/form_screen.dart';
import 'package:pos_flutter_project/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Tarefas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          // Registrando as possíveis rotas
          Routes.HOME: (context) => HomeScreen(),
          Routes.FORM: (context) => FormScreen(),
          Routes.DETAIL: (context) => DetailsScreen()
        },
      ),
    );
  }
}
