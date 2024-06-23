import 'package:flutter/material.dart';
import 'package:pos_flutter_project/providers/auth_provider.dart';
import 'package:pos_flutter_project/routes.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text("Email"),
                )),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(label: Text("Senha")),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;

                authProvider.signIn(email, password).then(
                      (response) => {
                        if (response)
                          {Navigator.pushNamed(context, Routes.HOME)}
                      },
                    );
              },
              child: const Text("Acessar")),
          const Padding(padding: EdgeInsets.only(top: 20)),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.SIGNUP);
            },
            child: const Text("Ainda não tenho cadastro!"),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          if (authProvider.message != null) Text(authProvider.message!),
        ],
      ),
    );
  }
}
