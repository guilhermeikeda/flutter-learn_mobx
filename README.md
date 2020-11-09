# learn_mobx

Learn MobX for Flutter

## Introdução

MobX é uma biblioteca de gerenciamento de estados que facilita a conexão entre dados reativos com a UI (ou qualquer observer) da sua aplicação.

O que é consumido == Observables
Aonde == Reactions

Alterações no observable --> Rodamos novamente os reactions


## Store

Mobo de coletar o estado de um observable a partir de uma classe.

Exemplo:

```
import 'package:mobx/mobx.dart';

// Include generated file
part 'counter.g.dart';

// This is the class used by rest of your codebase
class Counter = _Counter with _$Counter;

// The store-class
abstract class _Counter with Store {
    @observable
    int value = 0;

    @action
    void increment() {
    value++;
    }
}
```

É importante rodar o seguinte método para gerar as classes importadas pela diretiva 'part':

```
 flutter packages pub run build_runner build
 ```

 Caso queira gerar os arquivos automaticamente:

 ```
 flutter packages pub run build_runner watch
```

Podemos obter erro caso o arquivo tenha sido gerado por uma versão anterior do build_runner. Para prevenir esse erro:

```
flutter packages pub run build_runner watch --delete-conflicting-outputs
```
