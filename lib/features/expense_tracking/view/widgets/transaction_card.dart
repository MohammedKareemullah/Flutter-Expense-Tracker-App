import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final double value;
  final DateTime date;
  final TransactionType type;
  final TransactionCategory category;
  const TransactionCard({
    super.key,
    required this.title,
    required this.value,
    required this.date,
    required this.type,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final IconData icon = (type == TransactionType.income
        ? Icons.savings_outlined
        : Icons.wallet_outlined);
    final categoryName = category.name;
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(icon),
                    SizedBox(width: 16),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 8),
                Text(
                  '( $categoryName )',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Palette.greyColor,
                  ),
                ),

                Spacer(),
                Text(
                  '₹ $value',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
