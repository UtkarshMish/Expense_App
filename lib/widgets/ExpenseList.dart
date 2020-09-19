import 'package:Expenses_app/model/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatelessWidget {
  final List<Transaction> itemList;

  ExpenseList({this.itemList});
  Widget build(BuildContext context) {
    return Column(
      children: itemList
          .map((transaction) => Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2)),
                      child: Text(
                        "₹ ${transaction.amount}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          transaction.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                          overflow: TextOverflow.visible,
                        ),
                        Text(
                          DateFormat.yMEd()
                              .add_jms()
                              .format(transaction.dateTime),
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[400]),
                        )
                      ],
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
