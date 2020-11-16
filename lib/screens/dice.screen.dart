import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learn_mobx/components/dice.component.dart';
import 'package:learn_mobx/stores/dice.store.dart';
import 'package:provider/provider.dart';

final counter = DiceCounter();

class DiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Provider<DiceCounter>(
        create: (_) => DiceCounter(),
        child: Scaffold(
          backgroundColor: Colors.amber,
          appBar: AppBar(
            backgroundColor: Colors.amberAccent,
            title: Text(
              'Tap the dice !!!'.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Hind'),
            ),
          ),
          body: SafeArea(
            child: DiceView(),
          ),
        ),
      );
}

class DiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final diceCounter = Provider.of<DiceCounter>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Observer(
                  builder: (_) => DiceComponent(
                    diceNumber: diceCounter.left,
                  ),
                ),
              ),
              Expanded(
                child: Observer(
                  builder: (_) => DiceComponent(
                    diceNumber: diceCounter.right,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Observer(
              builder: (_) => Text(
                'Total ${diceCounter.total}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 16,
                  fontFamily: 'Verdana',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
