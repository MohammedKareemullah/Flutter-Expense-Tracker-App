import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart'; // Optional: for generating unique IDs

part 'transaction.g.dart';

@HiveType(typeId: 1)
enum TransactionType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}

@HiveType(typeId: 2)
enum TransactionCategory {
  @HiveField(0)
  salary,
  @HiveField(1)
  freelance,
  @HiveField(2)
  investment,

  @HiveField(3)
  food,
  @HiveField(4)
  shopping,
  @HiveField(5)
  transport,
  @HiveField(6)
  housing,
  @HiveField(7)
  entertainment,
  @HiveField(8)
  health,
  @HiveField(9)
  other;

  bool get isIncome =>
      this == TransactionCategory.salary ||
      this == TransactionCategory.freelance ||
      this == TransactionCategory.investment;

  static List<TransactionCategory> get expenseCategories => [
    TransactionCategory.food,
    TransactionCategory.shopping,
    TransactionCategory.transport,
    TransactionCategory.entertainment,
    TransactionCategory.health,
    TransactionCategory.other,
  ];

  static List<TransactionCategory> get incomeCategories => [
    TransactionCategory.salary,
    TransactionCategory.freelance,
    TransactionCategory.investment,
    TransactionCategory.other,
  ];
}

@HiveType(typeId: 0)
class Transaction {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double value;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final TransactionType type;

  @HiveField(5)
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
