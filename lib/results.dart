import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int tot_score;
  final Function reset;

  Results(this.tot_score, this.reset);

  String get phrase {
    //normal property value cal dynamic
    if (tot_score < 10)
      return 'You are Innocent';
    else if (tot_score < 18)
      return 'You are pretty likeable';
    else if (tot_score < 22) return 'Strange?';
    return 'So bad';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
            child: Text("You did it! \n $phrase \n Your score : $tot_score",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center)),
        Center(
            child: FlatButton(
            child: Text('Restart'),
              textColor: Colors.red,
             onPressed: reset,
        ))
      ],
    );
  }
}
