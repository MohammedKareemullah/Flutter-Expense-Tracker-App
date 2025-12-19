import 'package:expense_tracker_app/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double income;
  final double expense;
  final IconData incomeIcon;
  final IconData expenseIcon;
  const CustomCard({
    super.key,
    required this.income,
    required this.expense,
    required this.expenseIcon,
    required this.incomeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Text("Expenses", style: Apptheme().customTextStyle),
                        const SizedBox(width: 16),
                        const Spacer(),
                        Icon(expenseIcon, size: 30),
                        const SizedBox(width: 16),
                        Text('₹ $expense', style: Apptheme().customTextStyle),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Text("Income", style: Apptheme().customTextStyle),
                        const SizedBox(width: 16),
                        const Spacer(),
                        Icon(incomeIcon, size: 30),
                        const SizedBox(width: 16),
                        Text('₹ $income', style: Apptheme().customTextStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
