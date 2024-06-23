import 'dart:convert';

import 'package:pos_flutter_project_pk/folder.dart';
import 'package:http/http.dart' as http;

class FolderService {
  static const String url =
      "https://autocontrolpanel-default-rtdb.firebaseio.com/";
  static const String resource = "pastas";

  static Future<List<Folder>> getList() async {
    List<Folder> folders = List.empty(growable: true); //<Folder>[];
    http.Response response = await http.get(Uri.parse("$url$resource.json"));

    String resultStr = response.body;
    Map<String, dynamic> result = jsonDecode(resultStr);
    result.forEach((id, value) {
      folders.add(Folder.fromJson(id, value));
    });

    return folders;
  }

  static Future<Folder> insert(Folder folder) async {
    String data = jsonEncode(folder.toJson());
    http.Response response = await http.post(
      Uri.parse("$url$resource.json"),
      body: data,
    );
    String id = response.body;
    folder.id = id;
    return folder;
  }

  static Future<Folder> show(String id) async {
    http.Response response =
        await http.get(Uri.parse("$url$resource/$id.json"));
    String resultStr = response.body;
    Map<String, dynamic> result = jsonDecode(resultStr);
    return Folder.fromJson(id, result);
  }

  static Future<Folder> update(String id, Folder folder) async {
    String data = jsonEncode(folder.toJson());
    http.Response response =
        await http.put(Uri.parse("$url$resource/$id.json"), body: data);
    String body = response.body;
    folder.id = id;

    return folder;
  }

  static Future<bool> delete(String id) async {
    http.Response response =
        await http.delete(Uri.parse("$url$resource/$id.json"));

    if (response.statusCode == 200) return true;
    // String body = response.body;
    return false;
  }
}
