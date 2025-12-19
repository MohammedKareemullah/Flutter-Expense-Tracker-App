import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/pages/add_transaction.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker_app/features/expense_tracking/viewmodel/transaction_viewmodel.dart';

class TransactionCard extends ConsumerStatefulWidget {
  final String id;
  final String title;
  final double value;
  final DateTime date;
  final TransactionType type;
  final TransactionCategory category;
  const TransactionCard({
    super.key,
    required this.title,
    required this.value,
    required this.date,
    required this.type,
    required this.category,
    required this.id,
  });

  @override
  ConsumerState<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends ConsumerState<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    final IconData icon = (widget.type == TransactionType.income
        ? Icons.savings_outlined
        : Icons.wallet_outlined);

    String title = widget.title;
    String val = widget.value.toString();
    String categoryName = widget.category.name;
    String type = widget.type.name;

    int n = title.characters.length;
    int m = val.characters.length;
    int q = categoryName.characters.length;
    if (n > 8) {
      title = "${title.substring(0, 5)}...";
    }
    if (m > 8) {
      val = "${val.substring(0, 5)}...";
    }
    if (q > 8) {
      categoryName = "${categoryName.substring(0, 6)}...";
    }

    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(icon),
                    const SizedBox(width: 16),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Text(
                  '( $categoryName )',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Palette.greyColor,
                  ),
                ),

                const Spacer(),
                Text(
                  '₹ $val',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: (widget.type == TransactionType.income)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddTransaction(
                          isEdited: true,
                          title: widget.title,
                          value: widget.value,
                          type: widget.type,
                          category: widget.category,
                          id: widget.id,
                        ),
                      ),
                    );
                    setState(() {});
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    ref
                        .read(transactionNotifierProvider.notifier)
                        .deleteTransaction(widget.id);
                    setState(() {});
                    showSnackBar(context, "$title $type deleted sucessfully");
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
