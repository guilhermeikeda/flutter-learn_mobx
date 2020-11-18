import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:learn_mobx/stores/todo_list.store.dart';

class TodoListComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context);

    return Expanded(
      child: Observer(
        builder: (_) => ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: todoList.visibleTodos.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Observer(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Checkbox(
                        checkColor: Colors.pinkAccent,
                        value: todoList.visibleTodos[index].done,
                        onChanged: (_) => todoList.updateTodoStatus(
                            todoList.visibleTodos[index], _),
                      ),
                      Text(todoList.visibleTodos[index].description)
                    ],
                  ),
                ),
                Icon(Icons.delete)
              ],
            );
          },
        ),
      ),
    );
  }
}
