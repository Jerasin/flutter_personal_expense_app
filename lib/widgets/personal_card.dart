import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class PersonalCard extends StatelessWidget {
  final double amount;
  final String title;
  final DateTime date;
  const PersonalCard(
      {Key? key, required this.amount, required this.date, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 2)),
          padding: const EdgeInsets.all(10),
          child: Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColor),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              DateFormat.yMMMMd().format(date),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontSize: 20,
                  color: Colors.grey),
            )
          ],
        )
      ]),
    );
  }
}
