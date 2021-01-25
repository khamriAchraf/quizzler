import 'package:flutter/material.dart';

class Question {
  String questionText;
  bool answer;
  static Icon correct = Icon(
    Icons.check,
    color: Colors.green,
  );
  static Icon uncorrect = Icon(
    Icons.close,
    color: Colors.red,
  );
  static int score;

  Question(String questionText, bool answer) {
    this.questionText = questionText;
    this.answer = answer;
  }

  Widget check({bool attempt}) {
    if (attempt == this.answer) {
      return correct;
    } else {
      return uncorrect;
    }
  }
}
