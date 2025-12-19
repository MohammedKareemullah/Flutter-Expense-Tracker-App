import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CategoryPieChart extends StatelessWidget {
  final Map<TransactionCategory, double> data;

  const CategoryPieChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const Center(child: Text("No expenses yet"));

    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sectionsSpace: 4,
          centerSpaceRadius: 50,
          sections: data.entries.map((entry) {
            return PieChartSectionData(
              color: _getColor(entry.key),
              value: entry.value,
              title:
                  entry.key.name[0].toUpperCase() + entry.key.name.substring(1),
              radius: 80,
              titleStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Color _getColor(TransactionCategory cat) {
    // Add your own colors here
    switch (cat) {
      case TransactionCategory.food:
        return Colors.redAccent;
      case TransactionCategory.shopping:
        return Colors.blueAccent;
      case TransactionCategory.transport:
        return Colors.orangeAccent;
      default:
        return Colors.grey;
    }
  }
}
