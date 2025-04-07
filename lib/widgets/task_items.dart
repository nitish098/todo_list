import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task.dart';

import '../models/task_provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: ListTile(
        title: Text(task.title),
        trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => ShareTask(task: task),
              );
            },
            icon: const Icon(Icons.share)),
      ),
    );
  }
}

class ShareTask extends StatelessWidget {
  final Task task;
  final _emailController = TextEditingController();
  ShareTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Shraed Task"),
      content: TextField(
        controller: _emailController,
        decoration: const InputDecoration(hintText: 'Email address'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            return Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Provider.of<TaskProvider>(context, listen: false)
                .shareTask(task.id, _emailController.text);
            Navigator.of(context).pop();
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
