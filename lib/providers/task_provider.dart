import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:pos_flutter_project/models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task>? tasks = [
    Task(
      'Tarefa 1',
      '12-05-2024 20:00',
    ),
    Task(
      'Tarefa 2',
      '13-05-2024 15:00',
    ),
    Task(
      'Tarefa 3',
      '14-05-2024 12:00',
    ),
    Task(
      'Tarefa 4',
      '15-05-2024 10:00',
    ),
  ];

  void addTask(Task task) {
    tasks?.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks?.remove(task);
    notifyListeners();
  }

  void editTask(Task task, int index) {
    tasks![index] = task;
    notifyListeners();
  }

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
}
