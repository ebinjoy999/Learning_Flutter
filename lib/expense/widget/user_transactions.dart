import 'package:first_app/expense/model/transaction.dart';
import 'package:first_app/expense/widget/transactionlist.dart';
import 'package:flutter/material.dart';

import 'new_transactions.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

   List<Transaction> _transactions = [
    Transaction(dateTime: DateTime.now(),amount: 20.01,id:'t1', title: 'Lime'),
    Transaction(dateTime: DateTime.now(),amount: 33.33,id:'t2', title: 'Sanitiser'),
    Transaction(dateTime: DateTime.now(),amount: 66.22,id:'t3', title: 'Soap'),
    Transaction(dateTime: DateTime.now(),amount: 43.11,id:'t4', title: 'Rice'),
    Transaction(dateTime: DateTime.now(),amount: 55.22,id:'t5', title: 'Electricity bill')
  ];

  void _addNewTransaction(String title, double amount){
    final nextTransaction
    = new Transaction(id: DateTime.now().toString(), title: title, amount: amount, dateTime: DateTime.now());

    setState(() {
      _transactions.add(nextTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions)
      ],
    );
  }
}
