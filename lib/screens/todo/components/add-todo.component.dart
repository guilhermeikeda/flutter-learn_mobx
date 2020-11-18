import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn_mobx/stores/todo_list.store.dart';

class AddTodoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context);
    final controller = TextEditingController();

    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: 'Add todo'),
      onSubmitted: (_) {
        todoList.addTodo(_);
        controller.clear();
      },
    );
  }
}
