import 'package:first_app/expense/model/transaction.dart';
import 'package:first_app/expense/widget/new_transactions.dart';
import 'package:first_app/expense/widget/transactionlist.dart';
import 'package:first_app/expense/widget/user_transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyClass());

class MyClass extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Secound app")),
          body: Column(
            //List View like SingleChildScrollView + Column
//          body: SingleChildScrollView(  //SingleChildScrollView only work in defined height/width or in body
//            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Card(
                  color: Colors.red,
                  child: Container(
                    child: Text('CHART!'),
                    width: double.infinity,
                  ),
                ),
                UserTransaction()
              ],
             ),
            ));
  }
}