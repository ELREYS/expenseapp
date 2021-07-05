import '../models/transaction.dart';

import '../widget/new_transaction.dart';
import '../widget/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transactions> _userTransactions = [
    Transactions(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transactions(
      id: "t2",
      title: "Books",
      amount: 25.55,
      date: DateTime.now(),
    ),
    Transactions(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transactions(
      id: "t2",
      title: "Books",
      amount: 25.55,
      date: DateTime.now(),
    ),
    Transactions(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transactions(
      id: "t2",
      title: "Books",
      amount: 25.55,
      date: DateTime.now(),
    ),
    Transactions(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transactions(
      id: "t2",
      title: "Books",
      amount: 25.55,
      date: DateTime.now(),
    )
  ];

  void __addnewTransaction(String title, double amount) {
    final newTX = Transactions(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTX);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(__addnewTransaction),
        TranasactionList(
          userTransaction: _userTransactions,
        )
      ],
    );
  }
}
