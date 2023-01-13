import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = "You did it!";
    if (resultScore <= 8) {
      resultText = "You're awesome and innocent";
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 16) {
      resultText = "You're ... strange?";
    } else {
      resultText = "u so bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(onPressed: resetHandler, child: Text('Reset'))
        ],
      ),
    );
  }
}
