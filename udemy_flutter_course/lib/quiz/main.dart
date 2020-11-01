import 'package:first_app/quiz/quiz.dart';
import 'package:first_app/quiz/results.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement creatextate
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite colour?',
      'answers': [
        {'text': 'Black', 'score' : 10},
        {'text': 'Red', 'score' : 6},
        {'text': 'Green', 'score' : 3},
        {'text': 'Yellow', 'score' : 2}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
          {'text': 'Elephant', 'score' : 7},
          {'text': 'Cow', 'score' : 5},
          {'text': 'Crow', 'score' : 10},
          {'text': 'Lion', 'score' : 2}
        ]
    },
    {
      'questionText': 'Who is your favorite instructor?',
      'answers': [
        {'text': 'Bob', 'score' : 3},
        {'text': 'Alice', 'score' : 10},
        {'text': 'Alexa', 'score' : 5},
        {'text': 'Robert', 'score' : 8}
      ]
    }
  ];

  var questionIndex = 0;
  var _tot_score = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("First app")),
            body: (_questions.length < questionIndex + 1)
                ? Results(_tot_score, _reset)
                : Quiz(questions: _questions, answerQuestion: _answerQuestion, questionIndex: questionIndex)));
  }

  void _reset(){
    setState(() {
      questionIndex = 0;
      _tot_score = 0;
    });
  }

  void _answerQuestion(int score) {
    _tot_score += score;
    setState(() {
      questionIndex += 1;
    });

    print('Tappded');
  }
}
