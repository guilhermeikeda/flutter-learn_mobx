import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:learn_mobx/stores/todo_list.store.dart';

class TodoListComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context);

    return Observer(
      builder: (_) => Flexible(
        child: ListView.builder(
          itemCount: todoList.visibleTodos.length,
          itemBuilder: (context, index) {
            final todoItem = todoList.visibleTodos[index];

            return Observer(
              builder: (_) => CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: todoItem.done,
                  onChanged: (flag) =>
                      todoList.updateTodoStatus(todoItem, flag),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(todoItem.description,
                            overflow: TextOverflow.ellipsis),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => todoList.removeTodo(todoItem),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
