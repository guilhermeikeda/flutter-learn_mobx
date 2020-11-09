import 'package:mobx/mobx.dart';

// Inclui arquivo gerado
part 'counter.g.dart';

// Classe publica utilizada pelo resto do projeto.
class Counter = _Counter with _$Counter;

// Classe "store"

abstract class _Counter with Store {
  @observable 
  int value = 0;

  @action 
  void increment(){
    value ++;
  }
}

/**
  Observação:
   "with" keyword:
  
    Com esse keyword, podemos reutilizar o código de uma classe 
    em multiplas hierarquias de classes.
  
    Para criar um mixin, devemos criar uma classe que extende de Object e não possui construtor.
 */