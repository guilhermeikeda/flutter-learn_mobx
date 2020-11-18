import 'package:learn_mobx/models/enums/vibility_filter.dart';
import 'package:learn_mobx/stores/todo.store.dart';
import 'package:mobx/mobx.dart';

part 'todo_list.store.g.dart';

class TodoList = _TodoList with _$TodoList;

abstract class _TodoList with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>.of([
    Todo('Teste 1'),
    Todo('Teste 2'),
  ]);

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

  @computed
  ObservableList<Todo> get pendingTodos =>
      ObservableList.of(todos.where((todo) => todo.done != true));

  @computed
  ObservableList<Todo> get completedTodos =>
      ObservableList.of(todos.where((todo) => todo.done == true));

  @computed
  bool get hasCompletedTodos => completedTodos.isNotEmpty;

  @computed
  bool get hasPendingTodos => pendingTodos.isNotEmpty;

  @computed
  bool get canRemoveAllCompleted =>
      hasCompletedTodos && filter != VisibilityFilter.pending;

  @computed
  bool get canMarkAllCompleted =>
      hasPendingTodos && filter != VisibilityFilter.completed;

  @computed
  String get itemDescription {
    if (todos.isEmpty) {
      return "There are no Todos here. Why don't you add one?";
    }

    final suffix = pendingTodos.length == 1 ? 'todo' : 'todos';

    return '${pendingTodos.length} pending $suffix, ${completedTodos.length} completed';
  }

  @computed
  ObservableList<Todo> get visibleTodos {
    switch (filter) {
      case VisibilityFilter.pending:
        return pendingTodos;
      case VisibilityFilter.completed:
        return completedTodos;
      default:
        return todos;
    }
  }

  @action
  void addTodo(String description) {
    todos.add(Todo(description));
  }

  @action
  void changeFilter(VisibilityFilter filter) {
    this.filter = filter;
  }

  @action
  void removeTodo(Todo todo) {
    todos.removeWhere((x) => x == todo);
  }

  @action
  void markAllCompleted() {
    todos.forEach((todo) => todo.done = true);
  }

  @action
  void removeCompleted() {
    todos.removeWhere((todo) => todo.done);
  }

  @action
  void updateTodoStatus(Todo selectedTodo, bool done) {
    todos.firstWhere((_) => _ == selectedTodo).done = done;
  }
}
