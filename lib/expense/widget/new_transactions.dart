import 'package:first_app/expense/model/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  @override

  //String titleInput, amountInupt;
  final textAmountController = TextEditingController(),
      textTitleController = TextEditingController();

  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);


  Widget build(BuildContext context) {
    return  Card(child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title' ),
            controller: textTitleController,
            //onChanged: (value) => { titleInput = value},
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount' ),
            controller: textAmountController,
            //onChanged: (value) => { amountInupt = value},
          ),
          FlatButton(
            textColor: Colors.red,
            child: Text('Add Transaction'),
            onPressed: (){
              addNewTransaction(textTitleController.text, double.parse(textAmountController.text));
                },
          )
        ],),
    ),);
  }
}
