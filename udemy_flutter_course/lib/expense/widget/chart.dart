import 'package:first_app/expense/model/transaction.dart';
import 'package:first_app/expense/widget/chart_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentsTransaction;

  Chart(this.recentsTransaction);

   double get totalSpending {
     //fold allow to change list to another type with certain logic we defined in function we passes to fold
     return groupedTransactionValues.fold(0.0, (sum, item) {
        return sum+item['amount'];
     });
   }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(  //if u want only padding use Padding instead of container
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
              groupedTransactionValues.map((data){
                return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(data['day'], data['amount'], totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending)
                );
                 }).toList()
        ),
      ),
    );
  }

  List<Map<String, Object>> get groupedTransactionValues{
      return List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0.0;
        for(var i = 0; i < recentsTransaction.length; i++){
          if(recentsTransaction[i].dateTime.day == weekDay.day
              && recentsTransaction[i].dateTime.month == weekDay.month
              && recentsTransaction[i].dateTime.year == weekDay.year){
                totalSum += recentsTransaction[i].amount;
          }
        }
        print(DateFormat.E().format(weekDay));
        print(totalSum);
          return {
            'day':DateFormat.E().format(weekDay).substring(0,1), 'amount':totalSum
          };
      });
  }
}
