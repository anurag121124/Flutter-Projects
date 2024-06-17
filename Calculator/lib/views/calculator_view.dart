import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
  }

  void _updateValues() {
    setState(() {
      x = int.tryParse(displayOneController.text) ?? 0;
      y = int.tryParse(displayTwoController.text) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // calculator display
          DisplayOne(hint: "Enter First Number", controller: displayOneController),
          const SizedBox(height: 30),
          DisplayOne(hint: "Enter Last Number", controller: displayTwoController),
          const SizedBox(height: 30),
          Text(z.toString(), style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
          const Spacer(),

          // calculator buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  _updateValues();
                  setState(() {
                    z = x + y;
                  });
                  print(z);
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  _updateValues();
                  setState(() {
                    z = x - y;
                  });
                  print(z);
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  _updateValues();
                  setState(() {
                    z = x * y;
                  });
                  print(z);
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  _updateValues();
                  setState(() {
                    if (y != 0) {
                      z = x / y;
                    } else {
                      z = double.infinity; // Handle division by zero
                    }
                  });
                  print(z);
                },
                child: const Icon(CupertinoIcons.divide),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DisplayOne extends StatelessWidget {
  const DisplayOne({
    super.key,
    this.hint = "Enter a number",
    required this.controller,
  });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
