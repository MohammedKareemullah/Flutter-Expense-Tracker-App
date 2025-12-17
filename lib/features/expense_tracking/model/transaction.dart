import 'package:uuid/uuid.dart'; // Optional: for generating unique IDs

enum TransactionType { income, expense }

enum TransactionCategory {
  salary,
  freelance,
  investment,

  food,
  shopping,
  transport,
  housing,
  entertainment,
  health,
  other;

  bool get isIncome =>
      this == TransactionCategory.salary ||
      this == TransactionCategory.freelance ||
      this == TransactionCategory.investment;
}

class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;
  final TransactionType type;
  final TransactionCategory category;

  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
    required this.type,
    required this.category,
  });

  factory Transaction.create({
    required String title,
    required double value,
    required TransactionType type,
    required TransactionCategory category,
    DateTime? date,
  }) {
    return Transaction(
      id: const Uuid().v4(), // Generates a unique ID
      title: title,
      value: value,
      date: date ?? DateTime.now(),
      type: type,
      category: category,
    );
  }
}
