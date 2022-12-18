import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.pink,
        height: 60,
        padding: const EdgeInsets.all(10),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Test:'),
            SizedBox(
              width: 10,
            ),
            Text('555'),
          ],
        ));
  }
}
