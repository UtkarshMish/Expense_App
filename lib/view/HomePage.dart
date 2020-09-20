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
  void addTransaction(String title, double amount) {
    setState(() {
      transactionList.add(Transaction(
          id: (int.parse(transactionList.last.id) + 1).toString(),
          title: title,
          amount: amount,
          dateTime: DateTime.now()));
    });
  }

  void showTransactionForm(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.grey[200],
        context: ctx,
        builder: (_) => NewTransaction(addTransaction));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => showTransactionForm(context))
        ],
        title: Text("Expenses Manager"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTransactionForm(context),
        child: Icon(
          Icons.add,
          color: Theme.of(context).buttonColor,
          size: 30,
        ),
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
