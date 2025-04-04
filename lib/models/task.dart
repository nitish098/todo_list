import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;
  final String ownerId;
  final List<String> sharedWith;

  Task({
    required this.id,
    required this.title,
    required this.ownerId,
    this.sharedWith = const [],
  });
}

class TaskProvider with ChangeNotifier {
  final List<Task> _task = [];

  List<Task> get task => _task;

  void addTask(String addTitle, String ownerID) {
    _task.add(Task(
      id: DateTime.now().toString(),
      title: addTitle,
      ownerId: ownerID,
    ));

    notifyListeners();
  }

  void shareTask(String taskID, String taskEmail){
    final taskIndex = _task.indexWhere((element) => element.id == taskID);
    if(taskIndex == 0){
      _task[taskIndex].sharedWith.add(taskEmail);
    }
    notifyListeners();
  }

}
