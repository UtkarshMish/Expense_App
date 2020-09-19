import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function handleTransactions;

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
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
            ),
            FlatButton(
                onPressed: () => handleTransactions(
                    titleController.text, amountController.text),
                child: Text(
                  "Add Transaction",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
