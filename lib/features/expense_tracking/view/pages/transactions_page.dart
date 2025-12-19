import 'package:expense_tracker_app/features/expense_tracking/view/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker_app/features/expense_tracking/viewmodel/transaction_viewmodel.dart';

class TransactionsPage extends ConsumerStatefulWidget {
  const TransactionsPage({super.key});

  @override
  ConsumerState<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends ConsumerState<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    final transactions = ref.watch(transactionNotifierProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
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
                    itemCount: transactions.length,
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
