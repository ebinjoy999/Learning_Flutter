import 'package:flutter/material.dart';
import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  var questions = ['Question 1?', 'Question 2?', 'Question 3?'];
  var questionIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("First app")),
            body: Column(
              children: <Widget>[
                Question(questions[questionIndex]),
                RaisedButton(
                  child: Text('Answer1'),
                  onPressed: _answerQuestion,
                ),
                RaisedButton(
                  child: Text('Answer2'),
                  onPressed: (){
                    print('Answer2');
                  },
                ),
                RaisedButton(
                  child: Text('Answer3'),
                  onPressed:  () => print('Answer3'),
                )
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
