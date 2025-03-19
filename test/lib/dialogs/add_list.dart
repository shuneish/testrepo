import 'package:flutter/material.dart';

Future<String?> showAddTodoDialog(BuildContext context) async {
  String newTask = '';
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('New Task'),
        content: TextField(
          onChanged: (String value) {
            newTask = value;
          },
          decoration: InputDecoration(
            hintText: 'Input new task',
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, null);  // キャンセルの場合は null を返す
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, newTask);
            },
            child: Text('Add'),
          ),
        ],
      );
    },
  );
}
