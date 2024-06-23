import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pos_flutter_project/providers/auth_provider.dart';
import 'package:pos_flutter_project/routes.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? imagePath;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();

    return Scaffold(
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imagePath != null
                ? Stack(
                    children: [
                      Image.file(
                        width: 200,
                        height: 200,
                        File(imagePath!),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              imagePath = null;
                            });
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  )
                : IconButton(
                    onPressed: () async {
                      // navegar para outra tela e aguardar o retorno (uri da imagem capturada)
                      var result = await Navigator.of(context)
                          .pushNamed(Routes.SIGNUPPICTURE);
                      if (result != null) {
                        setState(() {
                          imagePath = result as String;
                        });
                      }
                    },
                    icon: const Icon(Icons.camera_alt)),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: TextFormField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Informe o email para cadastro.',
                    labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Informe um email válido!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: TextFormField(
                onChanged: (value) {
                  password = value;
                },
                decoration: const InputDecoration(
                    icon: Icon(Icons.key),
                    hintText: 'Informe uma senha para cadastro.',
                    labelText: 'Senha'),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Informe uma senha válida!';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    authProvider.signUp(email!, password!).then((sucesso) {
                      if (sucesso) {
                        try {
                          var storage = FirebaseStorage.instance;
                          var reference = storage.ref().child("$email.jpg");
                          // upload to storage
                          reference.putFile(File(imagePath!));
                        } on FirebaseException catch (e) {
                          print("Erro firebaseStorage: ${e.message}");
                        }
                        Navigator.pushReplacementNamed(context, Routes.HOME);
                      } else {
                        const Text("Não foi possível cadastrar usuário.");
                      }
                    });
                  }
                },
                child: const Text("Cadastrar")),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.SIGNIN);
                },
                child: const Text("Voltar")),
            const Padding(padding: EdgeInsets.only(top: 20)),
            if (authProvider.message != null) Text(authProvider.message!),
          ],
        ),
      )),
    );
  }
}
