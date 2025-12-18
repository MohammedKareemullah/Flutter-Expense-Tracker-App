import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  final String radioText1;
  final String radioText2;
  final TransactionType selectedType;
  final Function(TransactionType) onTypeChanged;
  const CustomRadio({
    super.key,
    required this.radioText1,
    required this.radioText2,
    required this.onTypeChanged,
    required this.selectedType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            title: Text(
              radioText1,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            value: TransactionType.values.byName(radioText1.toLowerCase()),
            groupValue: selectedType,
            onChanged: (value) {
              if (value != null) onTypeChanged(value);
            },
          ),
        ),

        // Create a RadioListTile for option 2
        Expanded(
          child: RadioListTile(
            title: Text(
              radioText2,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            value: TransactionType.values.byName(radioText2.toLowerCase()),
            groupValue: selectedType,
            onChanged: (value) {
              if (value != null) onTypeChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
