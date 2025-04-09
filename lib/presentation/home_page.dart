import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:to_do/models/task.dart';
import 'package:to_do/widgets/task_items.dart';

import '../models/task_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TaskProvider>(context);
    final task = tasksProvider.task;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("To-Do"),
        centerTitle: true,
      ),
      body: task.isEmpty
          ? const Center(
              child: Text("no task yet", style: TextStyle(fontSize: 20),),
            )
          : ListView.builder(
              itemCount: task.length,
              itemBuilder: (ctx, index) => TaskItem(
                task: task[index],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AskDialog(),
          );
        },
      ),
    );
  }
}

class AskDialog extends StatelessWidget {
  final _controller = TextEditingController();

  AskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add new To-Do tasks"),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: "To Do tasks"),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Provider.of<TaskProvider>(context, listen: false)
                .addTask(_controller.text, 'user1');
            Navigator.of(context).pop();    
          },
          child: const Text(
            "Add",
          ),
        )
      ],
    );
  }
}
