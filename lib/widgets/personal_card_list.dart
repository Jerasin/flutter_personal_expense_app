import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './personal_card.dart';
import 'package:intl/intl.dart';

class PersonalCardList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function fnDeleteTransaction;
  const PersonalCardList(
      {Key? key, required this.transactions, required this.fnDeleteTransaction})
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
                  const SizedBox(
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
                  return Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}')),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMMd().format(transactions[index].date),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          fnDeleteTransaction(transactions[index].id);
                        },
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
                  // return PersonalCard(
                  //   amount: transactions[index].amount,
                  //   date: transactions[index].date,
                  //   title: transactions[index].title,
                  // );
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
