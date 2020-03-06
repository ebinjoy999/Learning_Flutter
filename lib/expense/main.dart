import 'package:first_app/expense/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyClass());

class MyClass extends StatelessWidget {

  final List<Transaction> transactions = [
    Transaction(dateTime: DateTime.now(),amount: 20.01,id:'t1', title: 'Lime'),
    Transaction(dateTime: DateTime.now(),amount: 33.33,id:'t2', title: 'Sanitiser'),
    Transaction(dateTime: DateTime.now(),amount: 66.22,id:'t3', title: 'Soap'),
    Transaction(dateTime: DateTime.now(),amount: 43.11,id:'t4', title: 'Rice'),
    Transaction(dateTime: DateTime.now(),amount: 55.22,id:'t5', title: 'Electricity bill')
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Secound app")),
          body: Column(
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
              Card(child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                  TextField(decoration: InputDecoration(labelText: 'Title' ),),
                  TextField(decoration: InputDecoration(labelText: 'Amount' ),),
                  FlatButton(
                    textColor: Colors.red,
                    child: Text('Add Transaction'),
                    onPressed: (){},
                  )
                ],),
              ),),
              Column(
                children: transactions.map((tx){
                  return Card(
                    child:Row(children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Text(
                              '\$${tx.amount.toString()}',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.purple),
                          ),
                          decoration: BoxDecoration(border:  Border.all(color: Colors.purple, width: 2, style: BorderStyle.solid)),
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                            Text(tx.title.toString(),
                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            Text(DateFormat.yMMMMd().format(tx.dateTime),
                                style: TextStyle(fontSize: 12, color: Colors.grey))
                      ],)
                    ],),
                  );
                }).toList()
              ),
            ],
           ),
            ));
  }
}