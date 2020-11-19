import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:learn_mobx/stores/todo_list.store.dart';

class ActionButtonsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context);
    return Observer(
      builder: (_) => ButtonBar(
        children: <Widget>[
          RaisedButton(
            child: const Text('Remove Completed'),
            onPressed: todoList.canRemoveAllCompleted
                ? todoList.removeCompleted
                : null,
          ),
          RaisedButton(
            child: const Text('Mark All Completed'),
            onPressed:
                todoList.canMarkAllCompleted ? todoList.markAllCompleted : null,
          )
        ],
      ),
    );
  }
}
