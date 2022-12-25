import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormTransaction extends StatefulWidget {
  final Function fn;
  const FormTransaction({Key? key, required this.fn}) : super(key: key);

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitForm() {
    if (_amountController.text.isEmpty) {
      return;
    }

    const generateId = 3;
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.fn(
        id: 't$generateId',
        title: enteredTitle,
        amount: enteredAmount,
        date: _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor, // <-- SEE HERE
            )),
            child: child!,
          );
        }).then((value) {
      if (value == null) return;

      setState(() {
        _selectedDate = value;
      });
    });

    print(
      '.... $_selectedDate',
    );
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
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitForm(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No date Chosen!'
                        : 'Picked Date ${DateFormat.yMd().format(_selectedDate!)}'),
                  ),
                  TextButton(
                      child: Text('Choose Date',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold)),
                      onPressed: _presentDatePicker)
                ],
              ),
            ),
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor)),
                onPressed: () => _submitForm(),
                child: const Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
