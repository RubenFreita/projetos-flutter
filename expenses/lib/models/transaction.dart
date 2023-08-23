class Transaction {
  final int id;
  final String title;
  final double value;
  final DateTime dateTime;

  Transaction({
    required this.id,
    required this.dateTime,
    required this.title,
    required this.value,
  });
}
