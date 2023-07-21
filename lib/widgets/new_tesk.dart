import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key key, this.onAddTask}) : super(key: key);
  final void Function(Task task) onAddTask;
  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _startDate;
  DateTime _endDate;

  Future<void> _presentDatePicker() async {
    final firstDate = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: firstDate,
        firstDate: firstDate,
        lastDate: DateTime(firstDate.year + 5, firstDate.month, firstDate.day));

    setState(() {
      _startDate = pickedDate;
    });
  }

  Future<void> _presentEndDatePicker() async {
    final firstDate = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: firstDate,
        firstDate: firstDate,
        lastDate: DateTime(firstDate.year + 5, firstDate.month, firstDate.day));

    setState(() {
      _endDate = pickedDate;
    });
  }

  void _submitTaskData() {
    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty ||
        _startDate == null ||
        _endDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Invalid input'),
                content: Text(
                    'Invalid input make sure that title , descriptoin, start date and end date are correctly wrote'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(ctx), child: Text('Okay'))
                ],
              ));

      return;
    }

    widget.onAddTask(Task(
        title: _titleController.text,
        description: _descriptionController.text,
        startDate: _startDate,
        endDate: _endDate));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title')),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(label: Text('Description')),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(_startDate == null
                  ? "Start date"
                  : _startDate.toString().substring(0, 10)),
              IconButton(
                  onPressed: _presentDatePicker,
                  icon: Icon(Icons.calendar_month)),
              Spacer(),
              Text(_endDate == null
                  ? "End date"
                  : _endDate.toString().substring(0, 10)),
              IconButton(
                  onPressed: _presentEndDatePicker,
                  icon: Icon(Icons.calendar_month))
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'cancel',
                ),
              ),
              ElevatedButton(
                  onPressed: _submitTaskData, child: Text('Save task')),
            ],
          ),
        ],
      ),
    );
  }
}
