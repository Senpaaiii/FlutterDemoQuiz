import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 3) {
      resultText = 'You need to learn more';
    } else if (resultScore <= 6) {
      resultText = 'You need to brush up your knowledge';
    } else if (resultScore <= 9) {
      resultText = 'This is the average!';
    } else if(resultScore <= 12) {
      resultText = 'You are quite intelligent!!';
    }else{
      resultText = "Einstein!!!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              'Restart Quiz!',
            ),
            onPressed: resetHandler,
            style: TextButton.styleFrom(foregroundColor: Colors.deepOrange),
          ),
        ],
      ),
    );
  }
}
