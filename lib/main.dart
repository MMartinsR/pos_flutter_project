import 'package:flutter/material.dart';
import 'package:pos_flutter_project/providers/auth_provider.dart';
import 'package:pos_flutter_project/providers/task_provider.dart';
import 'package:pos_flutter_project/routes.dart';
import 'package:pos_flutter_project/screens/details_screen.dart';
import 'package:pos_flutter_project/screens/folder_list_screen.dart';
import 'package:pos_flutter_project/screens/form_screen.dart';
import 'package:pos_flutter_project/screens/home_screen.dart';
import 'package:pos_flutter_project/screens/signin_screen.dart';
import 'package:pos_flutter_project/screens/signup_picture_screen.dart';
import 'package:pos_flutter_project/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Tarefas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          // Registrando as possíveis rotas
          Routes.SIGNIN: (context) => SigninScreen(),
          Routes.SIGNUP: (context) => SignupScreen(),
          Routes.SIGNUPPICTURE: (context) => const SignupPictureScreen(),
          Routes.FOLDERLISTSCREEN: (context) => const FolderListScreen(),
          Routes.HOME: (context) => HomeScreen(),
          Routes.FORM: (context) => const FormScreen(),
          Routes.DETAIL: (context) => const DetailsScreen()
        },
      ),
    );
  }
}
