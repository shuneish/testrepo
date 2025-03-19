import 'package:flutter/material.dart';
import '../models/task.dart';

class TodoItem extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;

  const TodoItem({Key? key, required this.task, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete, // Firestore から削除
      ),
    );
  }
}