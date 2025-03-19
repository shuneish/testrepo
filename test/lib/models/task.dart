import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String title;
  final Timestamp createdAt;

  Task({required this.id, required this.title, required this.createdAt});

  // FirestoreのデータをTaskオブジェクトに変換
  factory Task.fromDocument(DocumentSnapshot doc) {
    return Task(
      id: doc.id,
      title: doc['title'],
      createdAt: doc['timestamp'] ?? Timestamp.now(),
    );
  }

  // Firestoreに保存するためのMapに変換
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'timestamp': createdAt,
    };
  }
}
