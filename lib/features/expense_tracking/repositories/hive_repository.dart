import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:hive/hive.dart';

class HiveRepository {
  static const String boxName = "Transcation_Box";

  Future<Box<Transaction>> get _box async =>
      await Hive.openBox<Transaction>(boxName);

  Future<void> addTransaction(Transaction transaction) async {
    final Box<Transaction> box = await _box;
    box.put(transaction.id, transaction);
  }

  Future<void> deleteTransaction(int transactionId) async {
    final Box<Transaction> box = await _box;
    box.delete(transactionId);
  }

  Future<void> updateTransaction(Transaction transaction) async {
    final Box<Transaction> box = await _box;
    box.put(transaction.id, transaction);
  }

  Future<List<Transaction>> getTransactions() async {
    final Box<Transaction> box = await _box;
    return box.values.toList();
  }
}
