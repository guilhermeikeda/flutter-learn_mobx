import 'package:flutter/material.dart';
import 'package:learn_mobx/screens/todo/components/description.component.dart';
import 'package:learn_mobx/screens/todo/components/todo_list.component.dart';
import 'package:provider/provider.dart';
import 'package:learn_mobx/stores/todo_list.store.dart';

import 'components/action-buttons.component.dart';
import 'components/visibility-filter.component.dart';
import 'components/add-todo.component.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Provider<TodoList>(
        create: (_) => TodoList(),
        child: Scaffold(
          appBar: AppBar(title: const Text('Todos')),
          body: Column(
            children: <Widget>[
              AddTodoComponent(),
              VisibilityFilterComponent(),
              ActionButtonsComponent(),
              DescriptionComponent(),
              TodoListComponent()
            ],
          ),
        ),
      );
}
