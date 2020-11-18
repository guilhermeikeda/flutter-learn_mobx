import 'package:flutter/material.dart';
import 'package:learn_mobx/screens/dice/dice.screen.dart';
import 'package:learn_mobx/screens/todo/todo.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/todo-list',
      routes: {
        '/': (_) => DiceScreen(),
        '/todo-list': (_) => TodoScreen()
      },
    );
  }
}
