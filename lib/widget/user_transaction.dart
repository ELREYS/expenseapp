import '../models/transaction.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TranasactionList(
          userTransaction: _userTransactions,
        )
      ],
    );
  }
}
