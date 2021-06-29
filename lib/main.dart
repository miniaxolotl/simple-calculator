import 'package:flutter/material.dart';

import 'package:calculator/ui/SimpleCalculator.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleCalculator(),
    );
  }
}
