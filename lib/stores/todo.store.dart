import 'package:mobx/mobx.dart';

part 'todo.store.g.dart';

class Todo = _Todo with _$Todo;

abstract class _Todo with Store {
  _Todo(this.description);

  @observable
  bool done = false;

  @observable
  String description = '';
}
