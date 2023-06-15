import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s the correct syntax to declare a variable in C++?',
      'answers': [
        {'text': 'var x;', 'score': 0},
        {'text': 'int x;', 'score': 4},
        {'text': 'x = int;', 'score': 0},
        {'text': 'declare x;', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s the output of?\n int x = 10;\n int y = x++;\n cout<<y;',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '11', 'score': 4},
        {'text': '9', 'score': 0},
        {'text': 'error', 'score': 0},
      ],
    },
    {
      'questionText': 'Data Structure following Last-In-First-Out principle?',
      'answers': [
        {'text': 'Queue', 'score': 0},
        {'text': 'Linked List', 'score': 0},
        {'text': 'Stack', 'score': 4},
        {'text': 'Tree', 'score': 0},
      ],
    },
    {
      'questionText': 'Worst case O(n^2) sorting algo?',
      'answers': [
        {'text': 'Insertion Sort', 'score': 0},
        {'text': 'Qucik Sort', 'score': 0},
        {'text': 'Bubble Sort', 'score': 4},
        {'text': 'Merge Sort', 'score': 0},
      ],
    },
    {
      'questionText': 'What is encapsulation in OOP??',
      'answers': [
        {'text': 'Binding data and functions into a single unit', 'score': 4},
        {'text': 'Hiding data within a class', 'score': 0},
        {'text': 'Inheriting properties from a base class', 'score': 0},
        {'text': 'Making use of objects in programming', 'score': 0},
      ],
    },{
      'questionText': 'What is inheritance in OOP??',
      'answers': [
        {'text': 'Creating multiple instances of a class', 'score': 0},
        {'text': 'Hiding data within a class', 'score': 0},
        {'text': 'Binding data and functions into a single unit', 'score': 0},
        {'text': 'Acquiring properties and behaviors of a base class', 'score': 4},
      ],
    },
  ];
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
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
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
