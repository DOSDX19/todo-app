import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key key, this.todo}) : super(key: key);

  final Task todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 49, 48, 48)),
              ),
              SizedBox(
                height: 8,
              ),
              Text(todo.description),
              Row(
                children: [
                  Text(todo.startDate.toString().substring(0, 10)),
                  Spacer(),
                  Text(todo.endDate.toString().substring(0, 10)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
