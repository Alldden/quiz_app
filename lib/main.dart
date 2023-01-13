import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/resul.dart';
import 'quiz.dart';
import 'resul.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
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
        'answers': ['Black', 'Green', 'Red', 'Blue']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Dog', 'Giraffe', 'Cat', 'Elephant']
      },
      {
        'questionText': 'What\'s your favorite instructor?',
        'answers': ['Max', 'Peter', 'Adam', 'Zeus']
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
            : Result(),
      ),
    );
  }
}
