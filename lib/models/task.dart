import 'package:flutter/material.dart';

class Task {
  final title;
  final description;
  DateTime startDate;
  DateTime endDate;

  Task(
      {@required this.title,
      @required this.description,
      @required this.startDate,
      @required this.endDate});
}
