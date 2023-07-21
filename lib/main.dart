import 'package:flutter/material.dart';
import 'package:todo_app/widgets/tasks.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Tasks(),
    ),
  );
}
