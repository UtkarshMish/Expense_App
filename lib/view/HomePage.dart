import 'package:Expenses_app/model/Transaction.dart';
import 'package:Expenses_app/widgets/TransactionForm.dart';
import 'package:Expenses_app/widgets/ExpenseList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageView();
}

class HomePageView extends State<HomePage> {
  bool viewForm = false;
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

  void showTransactionForm() {
    setState(() {
      viewForm = !viewForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses Manager"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTransactionForm(),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text("Graph goes is here !"),
            ),
          ),
          if (viewForm) TransactionForm(handleTransactions: addTransaction),
          ExpenseList(itemList: transactionList)
        ],
      ),
    );
  }
}
