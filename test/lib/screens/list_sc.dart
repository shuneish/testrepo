import 'package:flutter/material.dart';
import '../widgets/todo_item.dart';
import '../dialogs/add_list.dart';
import '../models/task_rep.dart';
import '../models/task.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TaskRepository _taskRepository = TaskRepository(); // Firestore リポジトリ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kzkzlist'),
      ),
      body: StreamBuilder<List<Task>>(
        stream: _taskRepository.getTasks(), // Firestore のタスク一覧を取得
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tasks yet.'));
          }

          final tasks = snapshot.data!;

          return ListView.builder(
            itemCount: tasks.length, // Firestore のデータに基づく
            itemBuilder: (context, index) {
              return TodoItem(
                task: tasks[index], // Firestore のデータを渡す
                onDelete: () async {
                  await _taskRepository.deleteTask(tasks[index].id); // Firestore から削除
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showAddTodoDialog(context);
          if (result != null && result['task'] != null && result['task']!.isNotEmpty) {
            await _taskRepository.addTask(result['task']!); // Firestore に追加
            // StreamBuilder が自動で更新されるので setState は不要
          }
        },
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }
}
