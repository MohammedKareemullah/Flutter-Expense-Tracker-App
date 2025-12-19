import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/pages/add_transaction.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatefulWidget {
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
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    final IconData icon = (widget.type == TransactionType.income
        ? Icons.savings_outlined
        : Icons.wallet_outlined);
    final categoryName = widget.category.name;
    String title = widget.title;
    String val = widget.value.toString();
    int n = widget.title.characters.length;
    int m = widget.value.toString().characters.length;
    if (n > 8) {
      title = "${widget.title.substring(0, 9)}...";
    }
    if (m > 8) {
      val = "${widget.value.toString().substring(0, 5)}...";
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
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
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
                  onPressed: () {},
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
