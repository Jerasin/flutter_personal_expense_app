import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';
import './widgets/status_card.dart';
import './models/transaction.dart';
import './widgets/form_transaction.dart';
import './widgets/personal_card_list.dart';
import './widgets/chart.dart';

void main() => {
      runApp(MaterialApp(
        title: 'Personal Expenses1',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          errorColor: Colors.red,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow),
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: const TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
        ),
        home: MyHomePage(),
      ))
    };

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: "t1", title: "New Computer", amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: "t2", title: "New Shoes", amount: 59.99, date: DateTime.now()),
    // Transaction(
    //     id: "t3", title: "New Game", amount: 59.99, date: DateTime.now()),
    // Transaction(
    //     id: "t4", title: "New Telephone", amount: 59.99, date: DateTime.now()),
    // Transaction(
    //     id: "t5", title: "New Airpod", amount: 59.99, date: DateTime.now()),
    // Transaction(
    //     id: "t6", title: "New Iphone", amount: 59.99, date: DateTime.now()),
    // Transaction(
    //     id: "t7", title: "New Car", amount: 59.99, date: DateTime.now()),
    // Transaction(
    //     id: "t8", title: "New Home", amount: 59.99, date: DateTime.now()),
    // Transaction(
    //     id: "t2", title: "New T-Shirt", amount: 59.99, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(
      {required String id,
      required String title,
      required double amount,
      required DateTime date}) {
    var newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: FormTransaction(fn: _addTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Personal Expenses',
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            // แกน Y
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // แกน X
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(recentTransaction: _recentTransactions),
              PersonalCardList(
                transactions: _userTransactions,
                fnDeleteTransaction: _deleteTransaction,
              ),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
