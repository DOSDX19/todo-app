import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/todo_list/todo_item.dart';

class Todolist extends StatelessWidget {
  const Todolist({
    @required this.todolist,
    @required this.onRemoveTask,
    Key key,
  }) : super(key: key);

  final List<Task> todolist;
  final void Function(Task task) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todolist.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(todolist[index]),
        onDismissed: (direction) => onRemoveTask(todolist[index]),
        child: TodoItem(todo: todolist[index]),
      ),
    );
  }
}
