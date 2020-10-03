import 'package:Expenses_app/model/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart({this.recentTransaction});

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (int i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].dateTime.day == weekDay.day &&
            recentTransaction[i].dateTime.month == weekDay.month &&
            recentTransaction[i].dateTime.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {"day": DateFormat.E().format(weekDay), "amount": totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return Container(
      width: double.infinity,
      child: Card(
        child: Text("Graph goes is here !"),
      ),
    );
  }
}
