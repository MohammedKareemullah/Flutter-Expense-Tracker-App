import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:expense_tracker_app/features/expense_tracking/repositories/analytics_helper.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/category_pie_chart.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/custom_card.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/transaction_card.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/weekly_bar_chart.dart';
import 'package:expense_tracker_app/features/expense_tracking/viewmodel/nav_index_provider.dart';
import 'package:expense_tracker_app/features/expense_tracking/viewmodel/transaction_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import 'package:intl/intl.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final transactions = ref.watch(transactionNotifierProvider);
    final totals = ref.watch(totalProvider);
    final weeklyData = AnalyticsHelper.calculateLast7DaysExpenses(
      transactions.value!,
    );

    //final trans = transactions[0];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Text(
                  DateFormat('d MMM yyyy').format(DateTime.now()),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomCard(
                income: totals[0],
                expense: totals[1],
                balance: totals[2],
                expenseIcon: Icons.wallet_outlined,
                incomeIcon: Icons.savings_outlined,
                balanceIcon: Icons.attach_money_outlined,
              ),
              const SizedBox(height: 15),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "RECENT TRANSACTIONS",
                      style: TextStyle(
                        color: Palette.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ref.read(navIndexProvider.notifier).state = 1;
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              transactions.when(
                data: (transactions) {
                  if (transactions.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Transactions yet!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: min(transactions.length, 4),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final trans = transactions[index];
                      return TransactionCard(
                        title: trans.title,
                        value: trans.value,
                        date: trans.date,
                        type: trans.type,
                        category: trans.category,
                        id: trans.id,
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: Text(
                      "Error : $error",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  );
                },
                loading: () =>
                    const Center(child: CircularProgressIndicator.adaptive()),
              ),

              const SizedBox(height: 15),
              const Divider(),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "ANALYTICS",
                      style: TextStyle(
                        color: Palette.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ref.read(navIndexProvider.notifier).state = 2;
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              WeeklyBarChart(data: weeklyData),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
