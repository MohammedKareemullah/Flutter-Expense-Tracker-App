import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrendLineChart extends StatelessWidget {
  final List<Transaction> transactions;
  const TrendLineChart({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    // Simple logic: Plotting the last 10 transactions by amount
    // Ideally, you would sort by date first
    var sorted = List<Transaction>.from(transactions)
      ..sort((a, b) => a.date.compareTo(b.date));
    if (sorted.length > 10) sorted = sorted.sublist(sorted.length - 10);

    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            // Bottom Axis: Dates
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval:
                    1, // Draw label for every point? Or increase to 2 to skip some
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < sorted.length) {
                    // Format date as "12 Dec" or "Mon"
                    final date = sorted[index].date;
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        DateFormat('d MMM').format(date),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }
                  return const Text('');
                },
              ),
            ),

            // Left Axis: Amounts
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40, // Space for "1000", "500" etc.
                getTitlesWidget: (value, meta) {
                  // Simplify large numbers (e.g., 1000 -> 1k)
                  if (value == 0) return const Text('');
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.shade300),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: sorted.asMap().entries.map((e) {
                // Determine Y value (positive for income, negative for expense?)
                // Or just plotting amount. Let's plot Expense Amount.
                return FlSpot(e.key.toDouble(), e.value.value);
              }).toList(),
              isCurved: true,
              color: Colors.green,
              barWidth: 3,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.green.withOpacity(0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
