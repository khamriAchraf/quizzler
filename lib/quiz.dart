import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questions.dart';

class Quiz {
  int _questionNumber = 0;
  List<Icon> _scoreKeeper = [];
  int _correctAnswers = 0;
  int _uncorrectAnswers = 0;
  int accuracy = 0;
  Color color;

  onBasicAlertPressed(context, accuracy) {
    Alert(
      context: context,
      title: "Finished!",
      desc: "You have reached the end of the quiz.",
      style: alertStyle,
      content: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Accuracy: $accuracy%',
            style: TextStyle(color: color),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Correct: $_correctAnswers",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.green,
        ),
        DialogButton(
          child: Text(
            "Uncorrect: $_uncorrectAnswers",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
        ),
      ],
    ).show();
  }

  var alertStyle = AlertStyle(
    descStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    backgroundColor: Colors.grey.shade700,
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
    ),
    titleStyle: TextStyle(
      color: Colors.white,
    ),
  );

  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextQuestion(context) {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      accuracy = _correctAnswers * 100 ~/ _questionBank.length;
      if (accuracy > 69) {
        color = Colors.green;
      } else if (accuracy < 41) {
        color = Colors.red;
      } else {
        color = Colors.orange;
      }
      print(_correctAnswers.toString() +
          ' ' +
          _questionBank.length.toString() +
          accuracy.toString());
      onBasicAlertPressed(context, accuracy);
      _questionNumber = 0;
      _scoreKeeper = [];
      _correctAnswers = 0;
      _uncorrectAnswers = 0;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  static Icon correct = Icon(
    Icons.check,
    color: Colors.green,
  );
  static Icon uncorrect = Icon(
    Icons.close,
    color: Colors.red,
  );

  Widget check({bool attempt}) {
    if (attempt == this.getCorrectAnswer()) {
      _scoreKeeper.add(correct);
      _correctAnswers++;
    } else {
      _scoreKeeper.add(uncorrect);
      _uncorrectAnswers++;
    }
  }

  List getScoreKeeper() {
    return _scoreKeeper;
  }
}
