class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;

  Transaction(
      {required this.amount,
      required this.id,
      required this.date,
      required this.title});
}
