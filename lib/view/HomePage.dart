import 'package:Expenses_app/model/Transaction.dart';
import 'package:Expenses_app/widgets/TransactionForm.dart';
import 'package:Expenses_app/widgets/ExpenseList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageView();
}

class HomePageView extends State<HomePage> {
  final List<Transaction> transactionList = <Transaction>[
    Transaction(
        id: '1',
        title: 'Lord Of the Rings Set',
        amount: 5300.0,
        dateTime: DateTime.now()),
    Transaction(
        id: '2', title: 'New Clothes', amount: 1850.0, dateTime: DateTime.now())
  ];
  void addTransaction(String title, String amount) {
    setState(() {
      transactionList.add(Transaction(
          id: (int.parse(transactionList.last.id) + 1).toString(),
          title: title,
          amount: double.parse(amount),
          dateTime: DateTime.now()));
    });
  }

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
          TransactionForm(handleTransactions: addTransaction),
          ExpenseList(itemList: transactionList)
        ],
      ),
    );
  }
}
