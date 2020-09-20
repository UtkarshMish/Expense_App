import 'package:Expenses_app/model/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatelessWidget {
  final List<Transaction> itemList;

  ExpenseList({this.itemList});
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      child: ListView.builder(
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2)),
                child: Text(
                  "₹ ${itemList[index].amount.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Column(
                children: [
                  Text(
                    itemList[index].title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    DateFormat.yMEd()
                        .add_jms()
                        .format(itemList[index].dateTime),
                    style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                  )
                ],
              )
            ],
          ),
        ),
        itemCount: itemList.length,
      ),
    );
  }
}
