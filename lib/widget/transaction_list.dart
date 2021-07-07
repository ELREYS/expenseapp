import 'package:expenseapp/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TranasactionList extends StatelessWidget {
  final List<Transactions> userTransaction;

  TranasactionList({required this.userTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: userTransaction.isEmpty
          ? Column(
              children: [
                Text("Not Transaction added yet!",
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: userTransaction.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      child: Text(
                        '\$${userTransaction[index].amount.toStringAsPrecision(4)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userTransaction[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          DateFormat.yMMMEd()
                              .format(userTransaction[index].date),
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ));
              },
            ),
    );
  }
}
