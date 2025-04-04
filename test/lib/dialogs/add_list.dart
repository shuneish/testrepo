import 'package:flutter/material.dart';

Future<Map<String, String>?> showAddTodoDialog(BuildContext context) async {
  String newTask = '';

  return showDialog<Map<String, String>>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('New Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (String value) {
                newTask = value;
              },
              decoration: InputDecoration(
                hintText: 'Input new task',
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, null); // キャンセル時は null を返す
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, {'task': newTask}); // OK時は Map を返す
            },
            child: Text('Add'),
          ),
        ],
      );
    },
  );
}

