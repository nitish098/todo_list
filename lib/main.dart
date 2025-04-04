import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/home_page.dart';

import 'models/task.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (ctx) => TaskProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 1, 70, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}


