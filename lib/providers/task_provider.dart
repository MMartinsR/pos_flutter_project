import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:pos_flutter_project_pk/pos_flutter_project_pk.dart';

class TaskProvider extends ChangeNotifier {
  FirebaseFirestore database = FirebaseFirestore.instance;
  String collection = "tarefas";
  List<Task> tasks = [];

  // void addTask(Task task) {
  //   tasks?.add(task);
  //   notifyListeners();
  // }

  // void removeTask(Task task) {
  //   tasks?.remove(task);
  //   notifyListeners();
  // }

  // void editTask(Task task, int index) {
  //   tasks![index] = task;
  //   notifyListeners();
  // }

  Future<LocationData?> getLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionStatus;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return null;
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) return null;
    }

    return location.getLocation();
  }

  // Firestore
  list() {
    database.collection(collection).get().then((QuerySnapshot qs) {
      for (var doc in qs.docs) {
        var task = doc.data() as Map<String, dynamic>;
        tasks.add(Task.fromMap(doc.id, task));
        notifyListeners();
      }
    });
  }

  insert(Task task) {
    var data = <String, dynamic>{
      'nome': task.name,
      'data': task.date,
    };
    var future = database.collection(collection).add(data);

    future.then((DocumentReference doc) {
      String id = doc.id;
      task.id = id;
      tasks.add(task);
      notifyListeners();
    });
  }

  delete(Task abast) {
    var future = database.collection(collection).doc(abast.id).delete();

    future.then((_) {
      tasks.remove(abast);
      notifyListeners();
    });
  }
}
