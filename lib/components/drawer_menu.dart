import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos_flutter_project/routes.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: ListTile(
              leading: const Icon(Icons.task),
              title: const Text('Tarefas'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pushNamed(context, Routes.HOME);
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Nova Tarefa'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, Routes.FORM);
            },
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('Pastas'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, Routes.FOLDERLISTSCREEN);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, Routes.SIGNIN);
            },
          ),
        ],
      ),
    );
  }
}
