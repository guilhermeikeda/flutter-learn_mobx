import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn_mobx/stores/todo_list.store.dart';

class ActionButtonsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: RaisedButton(
            child: Text('Remove Completed'),
            onPressed: todoList.removeCompleted,
          ),
        ),
        Container(
          child: RaisedButton(
            child: Text('Mark All Completed'),
            onPressed: todoList.markAllCompleted,
          ),
        ),
      ],
    );
  }
}
