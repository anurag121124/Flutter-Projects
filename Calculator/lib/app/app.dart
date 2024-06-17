import 'package:flutter/material.dart';
import 'package:flutterapp/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Run",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomeView(),
    );
  }
}

void main() {
  runApp(const MyApp());
}
