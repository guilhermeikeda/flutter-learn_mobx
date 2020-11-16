import 'package:flutter/material.dart';
import 'package:learn_mobx/screens/dice.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiceScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
