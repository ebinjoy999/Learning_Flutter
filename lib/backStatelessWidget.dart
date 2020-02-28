import 'package:flutter/material.dart';

void main() => runApp(MyClass());

class MyClass extends StatelessWidget {
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
                Text(questions[questionIndex]),
                RaisedButton(
                  child: Text('Answer1'),
                  onPressed: answerQuestion,
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
  void answerQuestion(){
    print('Tappded');
    questionIndex += 1;
  }
}
