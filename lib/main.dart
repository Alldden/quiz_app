import 'package:flutter/material.dart';
import './questin.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
    const questions = [
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
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(questions[_questionIndex]['questionText']),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(child: Text("You did it!")),
      ),
    );
  }
}
