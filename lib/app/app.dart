import 'package:flutter/material.dart';
import 'package:flutterapp/views/home_view.dart';
import 'package:flutterapp/views/home_view.dart';

class myapp extends StatelessWidget {
  const myapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Run",
      home: HomeView(),
    );
  }
}
