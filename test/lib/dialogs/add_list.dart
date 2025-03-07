import 'package:flutter/material.dart';

Future<String?> showAddTodoDialog(BuildContext context) async {
  String newTask = '';
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('新規'),
        content: TextField(
          onChanged: (String value) {
            newTask = value;
          },
          decoration: InputDecoration(
            hintText: 'タスクを入力してください',
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, null);  // キャンセルの場合は null を返す
            },
            child: Text('取り消し'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, newTask);
            },
            child: Text('追加'),
          ),
        ],
      );
    },
  );
}
