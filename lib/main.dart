import 'package:first_app/quiz.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite colour?',
      'answers': ['Black', 'Red', 'Green', 'Yellow']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Elephant', 'Cow', 'Crow', 'Lion']
    },
    {
      'questionText': 'Who is your favorite instructor?',
      'answers': ['Bob', 'Alice', 'Alexa', 'Robert']
    }
  ];
  var questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("First app")),
            body: (_questions.length < questionIndex + 1)
                ? Center(child: Text("You did it!"))
                : Quiz(questions: _questions, answerQuestion: _answerQuestion, questionIndex: questionIndex)));
  }
  void _answerQuestion() {
    setState(() {
      questionIndex += 1;
    });

    print('Tappded');
  }
}
