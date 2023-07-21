import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/todo_list/todolist.dart';
import 'package:todo_app/widgets/new_tesk.dart';

class Tasks extends StatefulWidget {
  Tasks({Key key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  void _openAddTaskOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewTask(onAddTask: _addTask),
    );
  }

  void _addTask(Task task) {
    setState(() {
      todolist.add(task);
    });
  }

  void _removeTask(Task task) {
    final taskIndex = todolist.indexOf(task);
    setState(() {
      todolist.remove(task);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Task deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () => setState(() {
                  todolist.insert(taskIndex, task);
                })),
      ),
    );
  }

  final List<Task> todolist = [
    Task(
        title:
            'Try pressing the plus sing in the top right corner to add a task',
        description: '',
        startDate: DateTime.now(),
        endDate: DateTime.now()),
    Task(
        title: 'Swipe to delete the task',
        description: '',
        startDate: DateTime.now(),
        endDate: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Text(
      'no task to do, try adding some!',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
    );

    if (todolist.isNotEmpty) {
      mainContent = Todolist(
        todolist: todolist,
        onRemoveTask: _removeTask,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Todo list app',
          style: TextStyle(color: Colors.cyan),
        ),
        actions: [
          IconButton(onPressed: _openAddTaskOverlay, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 142, 189, 250),
              Color.fromARGB(255, 250, 153, 108),
            ],
          ),
        ),
        child: Center(
          child: mainContent,
        ),
      ),
    );
  }
}
