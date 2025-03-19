import 'package:cloud_firestore/cloud_firestore.dart';
import 'task.dart';

class TaskRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _taskCollection = FirebaseFirestore.instance.collection('tasks');

  // タスクを追加
  Future<void> addTask(String title) async {
    await _taskCollection.add({
      'title': title,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // タスクを削除
  Future<void> deleteTask(String taskId) async {
    await _taskCollection.doc(taskId).delete();
  }

  // Firestoreのタスクリストを取得（Stream）
  Stream<List<Task>> getTasks() {
    return _taskCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) => Task.fromDocument(doc)).toList();
        });
  }
}
