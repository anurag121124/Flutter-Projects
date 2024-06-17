import 'package:flutter/material.dart';
import 'package:flutterapp/views/calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       backgroundColor: Colors.deepOrange,
         body: SafeArea(
          child: CalculatorView(),
        ),
    );
  }
}