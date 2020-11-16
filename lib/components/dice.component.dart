import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_mobx/stores/dice.store.dart';
import 'package:provider/provider.dart';

class DiceComponent extends StatelessWidget {
  final int diceNumber;

  DiceComponent({@required this.diceNumber});

  @override
  Widget build(BuildContext context) {
    final diceCounter = Provider.of<DiceCounter>(context);

    return FlatButton(
      child: Image.asset('images/dice$diceNumber.png'),
      onPressed: diceCounter.roll,
    );
  }
}
