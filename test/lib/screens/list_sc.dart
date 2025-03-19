import 'package:flutter/material.dart';
import '../widgets/todo_item.dart';
import '../dialogs/add_list.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todoItems = [];

  void _addTodoItem(String task) {
    setState(() {
      _todoItems.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kzkzlist'),
      ),
      body: ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (context, index) {
          return TodoItem(text: _todoItems[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await showAddTodoDialog(context);
          if (newTask != null && newTask.isNotEmpty) {
            _addTodoItem(newTask);
          }
        },
        tooltip: '追加',
        child: Icon(Icons.add),
      ),
    );
  }
}
