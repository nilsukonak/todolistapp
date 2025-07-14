import 'package:flutter/material.dart';
import 'package:todoapp/screens/login.dart';
import 'package:todoapp/screens/tasks.dart';
import 'screens/signin.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const Login(),
    );
  }
}
