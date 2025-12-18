import 'dart:math';

import 'package:expense_tracker_app/features/expense_tracking/view/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/Pages/transaction_data.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            SizedBox(height: 20),
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
