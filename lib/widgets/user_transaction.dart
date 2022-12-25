import 'package:flutter/material.dart';
import 'form_transaction.dart';
import './personal_card_list.dart';
import '../models/transaction.dart';

//! Not used Move To main.dart
class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: "t1", title: "New Computer", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Shoes", amount: 59.99, date: DateTime.now()),
    Transaction(
        id: "t3", title: "New Game", amount: 59.99, date: DateTime.now()),
    Transaction(
        id: "t4", title: "New Telephone", amount: 59.99, date: DateTime.now()),
    Transaction(
        id: "t5", title: "New Airpod", amount: 59.99, date: DateTime.now()),
    Transaction(
        id: "t6", title: "New Iphone", amount: 59.99, date: DateTime.now()),
    Transaction(
        id: "t7", title: "New Car", amount: 59.99, date: DateTime.now()),
    Transaction(
        id: "t8", title: "New Home", amount: 59.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New T-Shirt", amount: 59.99, date: DateTime.now()),
  ];

  void addTransaction(
      {required String id,
      required String title,
      required double amount,
      required DateTime date}) {
    var newTransaction =
        Transaction(id: id, title: title, amount: amount, date: date);
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FormTransaction(fn: addTransaction),
        // PersonalCardList(
        //   transactions: _userTransactions,
        // ),
      ],
    );
  }
}
