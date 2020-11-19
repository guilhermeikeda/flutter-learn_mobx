import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn_mobx/stores/todo_list.store.dart';

class AddTodoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context);
    final controller = TextEditingController();

    return TextField(
      autofocus: true,
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Add todo',
        contentPadding: EdgeInsets.all(8),
      ),
      textInputAction: TextInputAction.done,
      onSubmitted: (_) {
        todoList.addTodo(_);
        controller.clear();
      },
    );
  }
}
