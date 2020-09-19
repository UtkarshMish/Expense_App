import 'package:Expenses_app/model/Transaction.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<Transaction> itemList;
  ExpenseList({this.itemList});
  Widget build(BuildContext context) {
    return Column(
      children: itemList
          .map((transaction) => Card(
                child: Text(transaction.title),
              ))
          .toList(),
    );
  }
}
