import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/custom_dropdown.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/filter_dropdown.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker_app/features/expense_tracking/viewmodel/transaction_viewmodel.dart';
import 'package:intl/intl.dart';

class TransactionsPage extends ConsumerStatefulWidget {
  const TransactionsPage({super.key});

  @override
  ConsumerState<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends ConsumerState<TransactionsPage> {
  final List<TransactionCategory> categoryList = TransactionCategory.values;
  final Map<String, int> monthMap = {
    "January": 1,
    "February": 2,
    "March": 3,
    "April": 4,
    "May": 5,
    "June": 6,
    "July": 7,
    "August": 8,
    "September": 9,
    "October": 10,
    "November": 11,
    "December": 12,
  };

  TransactionCategory? selectedCategory;
  String? selectedMonth;

  @override
  void initState() {
    super.initState();
    selectedCategory = null;
  }

  @override
  Widget build(BuildContext context) {
    var transactions = ref.watch(transactionNotifierProvider);
    final List<String> monthList = monthMap.keys.toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "ALL TRANSACTIONS",
                      style: TextStyle(
                        color: Palette.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedCategory = null;
                          selectedMonth = null;
                        });
                      },
                      child: const Text(
                        "Remove Filter",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    CustomDropdown(
                      category: categoryList.map((e) => e.name).toList(),
                      selectedCategory:
                          selectedCategory ?? TransactionCategory.other,
                      onCategoryChanged: (val) {
                        setState(() {
                          selectedCategory = val;
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    FilterDropdown(
                      category: monthList,
                      selectedCategory:
                          selectedMonth ??
                          DateFormat('MMMM').format(DateTime.now()),
                      onCategoryChanged: (val) {
                        setState(() {
                          selectedMonth = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              transactions.when(
                data: (transactions) {
                  var filteredTransactions = transactions;
                  var datefilteredTransactions = transactions;
                  if (selectedCategory != null) {
                    filteredTransactions = transactions
                        .where((t) => t.category == selectedCategory)
                        .toList();

                    if (selectedMonth != null) {
                      datefilteredTransactions = filteredTransactions
                          .where((t) => t.date.month == monthMap[selectedMonth])
                          .toList();
                    } else {
                      datefilteredTransactions = filteredTransactions;
                    }
                  } else {
                    filteredTransactions = transactions;
                  }

                  if (datefilteredTransactions.isEmpty) {
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
                    itemCount: datefilteredTransactions.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final trans = datefilteredTransactions[index];
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
              const SizedBox(width: 80),
            ],
          ),
        ),
      ),
    );
  }
}
