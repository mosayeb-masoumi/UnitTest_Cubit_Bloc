import 'package:flutter/material.dart';
import 'package:flutter_testing_examle/di.dart';
import 'package:flutter_testing_examle/todo_feature/presentation/screen/todo_screen.dart';

void main() {
  setUpDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoScreen(),
    );
  }
}

