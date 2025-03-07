import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String text;

  const TodoItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
    );
  }
}
