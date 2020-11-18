import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learn_mobx/models/enums/vibility_filter.dart';
import 'package:learn_mobx/stores/todo_list.store.dart';
import 'package:provider/provider.dart';

class VisibilityFilterComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context);

    return Observer(
      builder: (_) => Column(
        children: [
          RadioListTile<VisibilityFilter>(
              title: const Text('All'),
              value: VisibilityFilter.all,
              groupValue: todoList.filter,
              onChanged: (VisibilityFilter value) {
                todoList.changeFilter(value);
              }),
          RadioListTile<VisibilityFilter>(
              title: const Text('Pending'),
              value: VisibilityFilter.pending,
              groupValue: todoList.filter,
              onChanged: (VisibilityFilter value) {
                todoList.changeFilter(value);
              }),
          RadioListTile<VisibilityFilter>(
              title: const Text('Completed'),
              value: VisibilityFilter.completed,
              groupValue: todoList.filter,
              onChanged: (VisibilityFilter value) {
                todoList.changeFilter(value);
              }),
        ],
      ),
    );
  }
}
