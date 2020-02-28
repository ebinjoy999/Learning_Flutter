import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //every widget should be in differ file unless a reason

  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
            questionText,
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center
    ));
  }
}
