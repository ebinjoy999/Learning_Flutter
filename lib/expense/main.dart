import 'package:first_app/expense/model/transaction.dart';
import 'package:first_app/expense/widget/new_transactions.dart';
import 'package:first_app/expense/widget/transactionlist.dart';
import 'package:first_app/expense/widget/user_transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyClass());

class MyClass extends StatefulWidget {

  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {

  List<Transaction> _transactions = [
    Transaction(dateTime: DateTime.now(),amount: 20.01,id:'t1', title: 'Lime'),
    Transaction(dateTime: DateTime.now(),amount: 33.33,id:'t2', title: 'Sanitiser'),
    Transaction(dateTime: DateTime.now(),amount: 66.22,id:'t3', title: 'Soap'),
    Transaction(dateTime: DateTime.now(),amount: 43.11,id:'t4', title: 'Rice'),
    Transaction(dateTime: DateTime.now(),amount: 55.22,id:'t5', title: 'Electricity bill')
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(
            theme: ThemeData(
              primarySwatch:  Colors.purple, //over primaryColor swatches will generate diff shades
              accentColor: Colors.amberAccent,
              fontFamily: 'Quicksand',
              textTheme: ThemeData.light().textTheme //basic texttheme + our overridden style
                  .copyWith(title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
              ),
              appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme //basic texttheme + our overridden style
                    .copyWith(title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
                ),
              )
            ),
            home: Scaffold(
              appBar: AppBar(
                title: Text(
                    "Personal expenses",
                    style: TextStyle(fontFamily: 'OpenSans'), //or we can set theme to apply all pages under Theme data
                ),
                actions: <Widget>[
                  Builder(builder: (context) =>
                      IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => _startAddNewTransaction(context)
                    ),
                  )
                ],
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
              floatingActionButton:  Builder(
                builder: (context) => FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      _startAddNewTransaction(context);
                    }
                ),
              ),
              body: Column(
                //List View like SingleChildScrollView + Column
//          body: SingleChildScrollView(  //SingleChildScrollView only work in defined height/width or in body
//            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                    color: Colors.blue,
                    child: Container(
                      child: Text('CHART!'),
                      width: double.infinity,
                    ),
                  ),
                  Container(
                      child: TransactionList(_transactions),

                  )
                ],
              ),
            )),
    );

  }

  void _startAddNewTransaction(BuildContext ct){
    showModalBottomSheet(
        context: ct,
        builder: (bCtx) {
      //bCtx transfer back after bulding sheet using our ct
        return NewTransaction(_addNewTransaction);
    },);
  }

  void _addNewTransaction(String title, double amount){
    final nextTransaction
    = new Transaction(id: DateTime.now().toString(), title: title, amount: amount, dateTime: DateTime.now());
    setState(() {
      _transactions.add(nextTransaction);
    });
  }
}