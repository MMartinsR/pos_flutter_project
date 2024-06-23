import 'package:flutter/material.dart';
import 'package:pos_flutter_project/components/drawer_menu.dart';
import 'package:pos_flutter_project/services/folder_service.dart';
import 'package:pos_flutter_project_pk/folder.dart';

class FolderListScreen extends StatelessWidget {
  const FolderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // FolderService.show("-O0-JWFcptAVYa-cigEI");
    // FolderService.update(
    // "-O0-JWFcptAVYa-cigEI", Folder("Pasta 1", "Arquivos da tarefa 1"));
    // FolderService.delete("-O0-JWFcptAVYa-cigEI");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pastas"),
        ),
        drawer: const DrawerMenu(),
        body: FutureBuilder(
          future: FolderService.getList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<Folder> folders = snapshot.data!;
                return ListView.builder(
                  itemCount: folders.length,
                  itemBuilder: (context, index) {
                    Folder folder = folders[index];
                    return ListTile(
                      // leading: IconButton(
                      //   onPressed: () {
                      //     // adicionar um form de adicao/edicao
                      //     FolderService.update(folder.id!, folder);
                      //   },
                      //   icon: const Icon(Icons.edit),
                      // ),
                      title: Text(folder.name),
                      subtitle: Text(folder.description),
                      trailing: IconButton(
                        onPressed: () {
                          FolderService.delete(folder.id!);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("Erro: ${snapshot.error.toString()}");
              } else {
                return const Text("Nenhuma pasta cadastrada.");
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}
