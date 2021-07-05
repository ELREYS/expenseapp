import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleInpCtrl = TextEditingController();
  final amountInpCtrl = TextEditingController();

  NewTransaction(this.addTx);

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
            ),
            TextField(
              decoration:
                  InputDecoration(labelText: "Amount", hintText: "Task"),
              controller: amountInpCtrl,
            ),
            TextButton(
                onPressed: () {
                  print(titleInpCtrl.text);
                  print(amountInpCtrl.text);
                  addTx(titleInpCtrl.text, double.parse(amountInpCtrl.text));
                },
                child: Text("Add Transaction"))
          ],
        ),
      ),
    );
  }
}
