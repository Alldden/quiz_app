import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Green', 'score': 5},
          {'text': 'Red', 'score': 3},
          {'text': 'Blue', 'score': 2}
        ]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Dog', 'score': 5},
          {'text': 'Giraffe', 'score': 9},
          {'text': 'Cat', 'score': 2},
          {'text': 'Elephant', 'score': 4}
        ]
      },
      {
        'questionText': 'What\'s your favorite instructor?',
        'answers': [
          {'text': 'Max', 'score': 5},
          {'text': 'Peter', 'score': 9},
          {'text': 'Adam', 'score': 15},
          {'text': 'Zeus', 'score': 3}
        ]
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My First App")),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
