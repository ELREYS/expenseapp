import 'package:expenseapp/widget/chart.dart';
import 'package:expenseapp/widget/transaction_list.dart';

import '../widget/new_transaction.dart';

import 'package:flutter/material.dart';
import '../models/transaction.dart';

class MyHome extends StatefulWidget {
  //String? titleInput;
  //String? amountInput;

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late Chart _chartCreation;

  final List<Transactions> _userTransactions = [
    // Transactions(
    //   id: "t1",
    //   title: "New Shoes",
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transactions(
    //   id: "t2",
    //   title: "Books",
    //   amount: 25.55,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transactions> get _recentTransaactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void __addnewTransaction(String title, double amount) {
    final newTX = Transactions(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _chartCreation = new Chart(recentTransactions: _userTransactions);
      _chartCreation.groupedTransactionValues;
      _userTransactions.add(newTX);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(__addnewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Quicksand",
        accentColor: Colors.amber,
        primarySwatch: Colors.purple,
        textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
      debugShowCheckedModeBanner: false,
      title: "Expense App",
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: Icon(Icons.add))
          ],
          title: Text(
            "Expense App",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chart(recentTransactions: _recentTransaactions),
              TranasactionList(userTransaction: _userTransactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
