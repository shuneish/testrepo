import 'package:flutter/material.dart';
import '../widgets/todo_item.dart';
import '../dialogs/add_list.dart';
import '../models/task_rep.dart';
import '../models/task.dart';

class TodoListScreen extends StatelessWidget {
  final TaskRepository _taskRepository = TaskRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kzkzlist'),
      ),
      body: StreamBuilder<List<Task>>(
        stream: _taskRepository.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tasks yet.'));
          }

          final tasks = snapshot.data!;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TodoItem(
                task: tasks[index], // Firestore のデータを渡す
                onDelete: () => _taskRepository.deleteTask(tasks[index].id), // 削除処理
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await showAddTodoDialog(context);
          if (newTask != null && newTask.isNotEmpty) {
            await _taskRepository.addTask(newTask); // Firestore に追加
          }
        },
        tooltip: '追加',
        child: Icon(Icons.add),
      ),
    );
  }
}