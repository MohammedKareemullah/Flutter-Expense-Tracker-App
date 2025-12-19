import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:expense_tracker_app/features/expense_tracking/repositories/analytics_helper.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/category_pie_chart.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/trend_line_chart.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/weekly_bar_chart.dart';
import 'package:expense_tracker_app/features/expense_tracking/viewmodel/transaction_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalyticsPage extends ConsumerWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionNotifierProvider);
    final categoryData = AnalyticsHelper.calculateCategoryExpenses(
      transactions.value!,
    );
    final weeklyData = AnalyticsHelper.calculateLast7DaysExpenses(
      transactions.value!,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "ANALYTICS",
                      style: TextStyle(
                        color: Palette.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  "Transaction Trend",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,

                  child: TrendLineChart(transactions: transactions.value!),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  "Spendings by Category",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,

                  child: CategoryPieChart(data: categoryData),
                ),
              ),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  "Weekly Spendings",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,

                  child: WeeklyBarChart(data: weeklyData),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
