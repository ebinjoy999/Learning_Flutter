import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  ChartBar extends StatelessWidget { //Stateless bcoz we don't want change data in single bar

  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox( //strict text box expansion with text size
            child: Text('\$${spendingAmount.toStringAsFixed(0)}')
        ),
        SizedBox(height: 4,),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: <Widget>[
            Container(decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              color: Color.fromRGBO(220, 220, 220, 1),
              borderRadius: BorderRadius.circular(10),
              )
            ),
            FractionallySizedBox(heightFactor: spendingPctOfTotal, child:
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                )
              ),)
          ],),
        ),
        SizedBox(height: 4,),
        Text(label),
      ],
    );
  }
}
