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
      child: transactions.isEmpty? Column(
        children: <Widget>[
          Text(
            "NO Transactions  found!",
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox( //like an empty view for margin
            height: 10,
          ),
          Container(  //for set image view wrap in height since parent column can't
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,),
          )
        ],
      ):
        ListView.builder(
          itemBuilder: (context, index) {
            //call for every new item
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      '\$${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle( 
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).primaryColor),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                            style: BorderStyle.solid)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title.toString(),
                        style: Theme.of(context).textTheme.title //accessing global theme
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
