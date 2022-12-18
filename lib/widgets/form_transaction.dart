import 'package:flutter/material.dart';

class FormTransaction extends StatefulWidget {
  final Function fn;
  const FormTransaction({Key? key, required this.fn}) : super(key: key);

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void submitForm() {
    const generateId = 3;
    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text;

    if (enteredTitle.isEmpty || enteredAmount.isEmpty) {
      return;
    }
    widget.fn(
        id: 't$generateId',
        title: enteredTitle,
        amount: double.parse(enteredAmount),
        date: DateTime.now());

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => submitForm(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitForm(),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () => submitForm(),
                child: const Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.purple),
                ))
          ],
        ),
      ),
    );
  }
}
