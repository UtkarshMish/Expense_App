import 'package:Expenses_app/model/Transaction.dart';
import 'package:Expenses_app/utils/ExpenseList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Transaction> transactionList = <Transaction>[
    Transaction(
        id: '1',
        title: 'Lord Of the Rings Extended Cut Set',
        amount: 5300.0,
        dateTime: DateTime.now()),
    Transaction(
        id: '2', title: 'New Clothes', amount: 1850.0, dateTime: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses App"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text("Graph goes is here !"),
            ),
          ),
          ExpenseList(itemList: transactionList)
        ],
      ),
    );
  }
}
