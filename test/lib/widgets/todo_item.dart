import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String text;

  const TodoItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, // ボタンの背景色
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10), // 波紋エフェクトの範囲
        onTap: () {
          print("Tapped!");
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.pink, // 文字色
            ),
          ),
        ),
      ),
    );
  }

}
