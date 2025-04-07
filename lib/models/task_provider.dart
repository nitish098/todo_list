import 'package:flutter/material.dart';

import 'task.dart';

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

  // Trying to access _tasks[0] when _tasks = []
  void shareTask(String taskId, String email) {
    final task = _task.firstWhere((t) => t.id == taskId); // Throws if not found
    task.sharedWith.add(email);
    notifyListeners();
  }
}
