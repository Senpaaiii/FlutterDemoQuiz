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
        {'text': 'int x;', 'score': 1},
        {'text': 'x = int;', 'score': 0},
        {'text': 'declare x;', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s the output of?\n int x = 10;\n int y = x++;\n cout<<y;',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '11', 'score': 1},
        {'text': '9', 'score': 0},
        {'text': 'error', 'score': 0},
      ],
    },
    {
      'questionText': 'Data Structure following Last-In-First-Out principle?',
      'answers': [
        {'text': 'Queue', 'score': 0},
        {'text': 'Linked List', 'score': 0},
        {'text': 'Stack', 'score': 1},
        {'text': 'Tree', 'score': 0},
      ],
    },
    {
      'questionText': 'Worst case O(n^2) sorting algo?',
      'answers': [
        {'text': 'Insertion Sort', 'score': 0},
        {'text': 'Quick Sort', 'score': 0},
        {'text': 'Bubble Sort', 'score': 1},
        {'text': 'Merge Sort', 'score': 0},
      ],
    },
    {
      'questionText': 'What is encapsulation in OOP?',
      'answers': [
        {'text': 'Binding data and functions into a single unit', 'score': 1},
        {'text': 'Hiding data within a class', 'score': 0},
        {'text': 'Inheriting properties from a base class', 'score': 0},
        {'text': 'Making use of objects in programming', 'score': 0},
      ],
    },
    {
      'questionText': 'What is inheritance in OOP?',
      'answers': [
        {'text': 'Creating multiple instances of a class', 'score': 0},
        {'text': 'Hiding data within a class', 'score': 0},
        {'text': 'Binding data and functions into a single unit', 'score': 0},
        {'text': 'Acquiring properties and behaviors of a base class', 'score': 1},
      ],
    },
    {
      'questionText': 'What does SQL stand for?',
      'answers': [
        {'text': 'Structured Query Language', 'score': 1},
        {'text': 'Sequential Query Language', 'score': 0},
        {'text': 'Secure Query Language', 'score': 0},
        {'text': 'Simple Query Language', 'score': 0},
      ],
    },
    {
      'questionText': 'Which SQL command is used to retrieve data from a database?',
      'answers': [
        {'text': 'DELETE', 'score': 0},
        {'text': 'UPDATE', 'score': 0},
        {'text': 'SELECT', 'score': 1},
        {'text': 'INSERT', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the time complexity of searching an element in a binary search tree (BST) in the worst case?',
      'answers': [
        {'text': 'O(log n)', 'score': 1},
        {'text': 'O(n)', 'score': 0},
        {'text': 'O(n log n)', 'score': 0},
        {'text': 'O(1)', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the time complexity of the best-case scenario for the Bubble Sort algorithm?',
      'answers': [
        {'text': 'O(log n)', 'score': 0},
        {'text': 'O(n)', 'score': 0},
        {'text': 'O(n log n)', 'score': 0},
        {'text': 'O(1)', 'score': 1},
      ],
    },
    {
      'questionText': 'Which data structure uses the "First-In-First-Out" principle?',
      'answers': [
        {'text': 'Stack', 'score': 0},
        {'text': 'Linked List', 'score': 0},
        {'text': 'Queue', 'score': 1},
        {'text': 'Hash Table', 'score': 0},
      ],
    },
    {
      'questionText': 'Which data structure is based on the concept of "divide and conquer"?',
      'answers': [
        {'text': 'Heap', 'score': 0},
        {'text': 'Graph', 'score': 0},
        {'text': 'Tree', 'score': 1},
        {'text': 'Array', 'score': 0},
      ],
    },
    {
      'questionText': 'What will be the output of the following C++ code for n = 6?\n int foo(int n) {\n if (n <= 1) {\nreturn n;\n} else {\nreturn foo(n - 1) + foo(n - 2);\n}}',
      'answers': [
        {'text': '0', 'score': 0},
        {'text': '6', 'score': 0},
        {'text': '8', 'score': 0},
        {'text': '13', 'score': 1},
      ],
    },
    {
      'questionText': 'Time complexity?\nint power(int base, int exp) {if (exp == 0) {\nreturn 1;\n} else if (exp % 2 == 0) {\nint temp = power(base, exp / 2);\nreturn temp * temp;\n} else {\nint temp = power(base, (exp - 1) / 2);\nreturn base * temp * temp;\n}}',
      'answers': [
        {'text': 'O(1)', 'score': 0},
        {'text': 'O(n)', 'score': 0},
        {'text': 'O(logn)', 'score': 1},
        {'text': 'O(nlogn)', 'score': 0},
      ],
    },
    {
      'questionText': 'Which of the following is NOT a fundamental principle of object-oriented programming?',
      'answers': [
        {'text': 'Encapsulation', 'score': 0},
        {'text': 'Inheritance', 'score': 0},
        {'text': 'Abstraction', 'score': 0},
        {'text': 'Procedural Programming', 'score': 1},
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
    // var aBool = true;
    // aBool = false;

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
          title: Text('Test CSE knowledge!'),
          backgroundColor: Colors.black,
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
