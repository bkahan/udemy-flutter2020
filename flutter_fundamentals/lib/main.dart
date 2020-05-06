import "package:flutter/material.dart";

import "./quiz.dart";
import "./result.dart";

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // underline implies private, like python
  int _questionIndex = 0;
  int _totalScore = 0 ;

  final _questions = const [
    // const means compile time constant, not runtime constant
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 2},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 6},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'What\'s your favourite state?',
      'answers': [
        {'text': 'MA', 'score': 10},
        {'text': 'NY', 'score': 3},
        {'text': 'CT', 'score': 2},
        {'text': 'CA', 'score': 8},
      ],
    },
  ];

  void _resetQuiz() {
   setState(() {
     _questionIndex = 0;
     _totalScore = 0;
   });
  }

  void _answerQuestion(int score ) {

    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print('Answer Chosen!');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    ); // from material package
  }
}