import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/Pages/transaction_data.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/Pages/transactions_page.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/custom_card.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //final trans = transactions[0];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomCard(
              income: 123.3,
              expense: 187.7,
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
              child: ListView.builder(
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
