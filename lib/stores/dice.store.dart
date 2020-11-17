import 'dart:math';
import 'package:mobx/mobx.dart';

part 'dice.store.g.dart';

class DiceCounter = _DiceCounter with _$DiceCounter;

abstract class _DiceCounter with Store {
  static const int MAX_DICE_VALUE = 6;

  @observable
  int left = _randomDiceValue();

  @observable
  int right = _randomDiceValue();

  @computed
  int get total => left + right;

  @action
  void roll() {
    left = _randomDiceValue();
    right = _randomDiceValue();
  }

  static int _randomDiceValue() {
    return Random().nextInt(MAX_DICE_VALUE) + 1;
  }
}
