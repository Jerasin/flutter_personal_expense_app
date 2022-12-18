import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './personal_card.dart';

class PersonalCardList extends StatelessWidget {
  final List<Transaction> transactions;
  const PersonalCardList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        // ListView ใช้กับ List ที่มีขนาดที่แน่นอน
        // ListView builder ใช้กับ List ที่มีขนาดที่ไม่แน่นอน
        child: transactions.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No Transaction added yet!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover))
                ],
              )
            : ListView.builder(
                itemBuilder: ((context, index) {
                  return PersonalCard(
                    amount: transactions[index].amount,
                    date: transactions[index].date,
                    title: transactions[index].title,
                  );
                }),
                itemCount: transactions.length,
                // children: transactions
                //     .map((e) => PersonalCard(
                //           amount: e.amount,
                //           date: e.date,
                //           title: e.title,
                //         ))
                //     .toList()),
              ));
  }
}
