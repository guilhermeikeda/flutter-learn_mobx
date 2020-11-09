# learn_mobx

Learn MobX for Flutter

## Introdução

MobX é uma biblioteca de gerenciamento de estados que facilita a conexão entre dados reativos com a UI (ou qualquer observer) da sua aplicação.

O que é consumido == Observables
Aonde == Reactions

Alterações no observable --> Rodamos novamente os reactions

## Conceito chave

[ Reactions ] --dispara--> [ Actions ] --altera--> [ Observables ] --notifica--> [ Reactions ]


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

## Computed Observables

O estado da sua aplicação consiste de  "core-state" e "derived-state".

Exemplo: Classe Contato possui campo primeiroNome e sobreNome. Estes campos são core-state. Caso tenha uma propriedade nomeCompleto ela será "derived-state" (obtem da combinação dos core-state)


Exemplo:
```
import 'package:mobx/mobx.dart';

part 'contact.g.dart';

class Contact = ContactBase with _$Contact;

abstract class ContactBase with Store {
  @observable
  String firstName;

  @observable
  String lastName;

  @computed
  String get fullName => '$firstName, $lastName';

}
```

## Reactions
```
import 'package:mobx/mobx.dart';

String greeting = Observable('Hello World');

final dispose = reaction((_) => greeting.value, (msg) => print(msg));

greeting.value = 'Hello MobX'; // Cause a change

// Done with the reaction()
dispose();


// Prints:
// Hello MobX
```


ReactionDisposer when(bool Function(Reaction) predicate, void Function() effect)

```
import 'package:mobx/mobx.dart';

String greeting = Observable('Hello World');

final dispose = when((_) => greeting.value == 'Hello MobX', () => print('Someone greeted MobX'));

greeting.value = 'Hello MobX'; // Causes a change, runs effect and disposes


// Prints:
// Someone greeted MobX
```

Future<void> asyncWhen(bool Function(Reaction) predicate)
```
final completed = Observable(false);

void waitForCompletion() async {
  await asyncWhen(() => completed.value == true);

  print('Completed');
}
```


TODO: https://mobx.netlify.app/examples/counter