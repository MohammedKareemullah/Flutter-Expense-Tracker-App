import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';

class AnalyticsHelper {
  static Map<TransactionCategory, double> calculateCategoryExpenses(
    List<Transaction> transactions,
  ) {
    Map<TransactionCategory, double> totals = {};

    for (var transaction in transactions) {
      if (transaction.type == TransactionType.expense) {
        totals[transaction.category] =
            (totals[transaction.category] ?? 0) + transaction.value;
      }
    }
    return totals;
  }

  static Map<String, double> calculateLast7DaysExpenses(
    List<Transaction> transactions,
  ) {
    Map<String, double> days = {};
    DateTime now = DateTime.now();

    for (int i = 6; i >= 0; i--) {
      DateTime date = now.subtract(Duration(days: i));
      String dayName = _getDayName(date.weekday);
      days[dayName] = 0.0;
    }

    for (var transaction in transactions) {
      if (transaction.type == TransactionType.expense) {
        final difference = now.difference(transaction.date).inDays;
        if (difference <= 6 && difference >= 0) {
          String dayName = _getDayName(transaction.date.weekday);
          days[dayName] = (days[dayName] ?? 0) + transaction.value;
        }
      }
    }
    return days;
  }

  static String _getDayName(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }
}
