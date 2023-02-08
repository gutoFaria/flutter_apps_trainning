import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String? questionText;
  const Question(String string, {this.questionText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText.toString(),
        style: const TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
