import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInpCtrl = TextEditingController();

  final amountInpCtrl = TextEditingController();

  void submitData() {
    final enteredTitle = titleInpCtrl.text;
    final enteredAmount = double.parse(amountInpCtrl.text);

    try {
      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        //return;
      } else {
        widget.addTx(enteredTitle, (enteredAmount));

        Navigator.of(context).pop();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title", hintText: "Task"),
              controller: titleInpCtrl,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              keyboardType: TextInputType.datetime,
              decoration:
                  InputDecoration(labelText: "Amount", hintText: "Task"),
              controller: amountInpCtrl,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
                onPressed: () {
                  print(titleInpCtrl.text);
                  print(amountInpCtrl.text);
                  submitData();
                },
                child: Text("Add Transaction"))
          ],
        ),
      ),
    );
  }
}
