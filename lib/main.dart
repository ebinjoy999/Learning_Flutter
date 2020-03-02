import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  var questions = [
    {
      'questionText' : 'What\'s your favorite colour?',
      'answers' : ['Black', 'Red', 'Green', 'Yellow']
    },
    {
      'questionText' : 'What\'s your favorite animal?',
      'answers' : ['Elephant', 'Cow', 'Crow', 'Lion']
    },
    {
      'questionText' : 'Who is your favorite instructor?',
      'answers' : ['Bob', 'Alice', 'Alexa', 'Robert']
    }
  ];
  var questionIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("First app")),
            body: Column(
              children: <Widget>[
                Question(questions[questionIndex]['questionText']),
                ...(questions[questionIndex]['answers'] as List<String>).map((answer){
                  return Answer(_answerQuestion, answer);
                }).toList()
              ],
            )));
  }
  void _answerQuestion(){
    setState(() {
      if(questions.length > questionIndex+1 )
      questionIndex += 1;
    });
    print('Tappded');
  }
}
