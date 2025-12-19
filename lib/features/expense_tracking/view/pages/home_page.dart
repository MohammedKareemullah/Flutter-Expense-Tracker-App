import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/Pages/transactions_page.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/custom_card.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/transaction_card.dart';
import 'package:expense_tracker_app/features/expense_tracking/viewmodel/transaction_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

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

    //final trans = transactions[0];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCard(
              income: totals[0],
              expense: totals[1],
              expenseIcon: Icons.wallet_outlined,
              incomeIcon: Icons.savings_outlined,
            ),
            const SizedBox(height: 15),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "RECENT TRANSACTION",
                    style: TextStyle(
                      color: Palette.greyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TransactionsPage(),
                        ),
                      );
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
            Expanded(
              child: transactions.when(
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
            ),
          ],
        ),
      ),
    );
  }
}
