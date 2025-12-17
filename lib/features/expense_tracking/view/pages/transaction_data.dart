import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';

final transactions = [
  Transaction.create(
    title: "StarBucks",
    value: 112,
    type: TransactionType.expense,
    category: TransactionCategory.food,
  ),
  Transaction.create(
    title: "Salary",
    value: 111,
    type: TransactionType.income,
    category: TransactionCategory.salary,
  ),
  Transaction.create(
    title: "Printables",
    value: 171,
    type: TransactionType.income,
    category: TransactionCategory.freelance,
  ),
  Transaction.create(
    title: "Zudio",
    value: 81,
    type: TransactionType.expense,
    category: TransactionCategory.shopping,
  ),
];
