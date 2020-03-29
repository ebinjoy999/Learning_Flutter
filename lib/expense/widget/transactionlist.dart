import 'package:first_app/expense/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, //Vertical viewport was given unbounded height.
      //ListView(children:) //all items will be loaded
      //ListView.Builder()  //item on screen will be loaded
      child: ListView.builder(
          itemBuilder: (context, index) {
            //call for every new item
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      '\$${transactions[index].amount.toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.purple,
                            width: 2,
                            style: BorderStyle.solid)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(DateFormat.yMMMMd().format(transactions[index].dateTime),
                          style: TextStyle(fontSize: 12, color: Colors.grey))
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: transactions.length,
//          children: transactions.map((tx) {
//
//          }).toList()
          ),
    );
  }
}
