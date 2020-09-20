import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransaction;
  NewTransaction(this._addTransaction);
  @override
  TransactionForm createState() =>
      TransactionForm(handleTransactions: _addTransaction);
}

class TransactionForm extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function handleTransactions;

  void submitData() {
    setState(() {
      final double amount = double.parse(amountController.text);
      if (titleController.text.isNotEmpty && !amount.isNaN)
        handleTransactions(titleController.text, amount);
    });
  }

  TransactionForm({this.handleTransactions});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                autofocus: true,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                decoration: InputDecoration(labelText: "Title"),
                controller: titleController,
                onSubmitted: (_) => submitData()),
            TextField(
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
                onPressed: () => submitData(),
                child: Text(
                  "Add Transaction",
                  style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
