import 'package:first_app/expense/model/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  @override

  //String titleInput, amountInupt;
  final textAmountController = TextEditingController(),
      textTitleController = TextEditingController();

  Widget build(BuildContext context) {
    return  Card(child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title' ),
            controller: textTitleController,
            keyboardType: TextInputType.text,
            //onChanged: (value) => { titleInput = value},
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount' ),
            controller: textAmountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitButton(), // '_'  get an arg but not using it
            //onChanged: (value) => { amountInupt = value},
          ),
          FlatButton(
            textColor: Colors.red,
            child: Text('Add Transaction'),
            onPressed: (){
              submitButton();
                },
          )
        ],),
    ),);
  }

  void submitButton(){
    String title = textTitleController.text;
    double amount = double.parse(textAmountController.text);
    if(title.isEmpty || amount <= 0){
      return;
    }
    widget.addNewTransaction(title, amount); //you can access properties by widget // only available in state class
    Navigator.of(context).pop(); //pop close topmost
  }
}
