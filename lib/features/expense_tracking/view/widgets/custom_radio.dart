import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  final String radioText1;
  final String radioText2;
  const CustomRadio({
    super.key,
    required this.radioText1,
    required this.radioText2,
  });

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  TransactionType type = TransactionType.expense;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Create a RadioListTile for option 1
        Expanded(
          child: RadioListTile(
            title: Text(
              widget.radioText1,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            value: TransactionType.income, // Assign a value of 1 to this option
            groupValue: type, // Use _selectedValue to track the selected option
            onChanged: (value) {
              setState(() {
                type =
                    value!; // Update _selectedValue when option 1 is selected
              });
            },
          ),
        ),

        // Create a RadioListTile for option 2
        Expanded(
          child: RadioListTile(
            title: Text(
              widget.radioText2,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ), // Display the title for option 2          // Display a subtitle for option 2
            value:
                TransactionType.expense, // Assign a value of 2 to this option
            groupValue: type, // Use _selectedValue to track the selected option
            onChanged: (value) {
              setState(() {
                type =
                    value!; // Update _selectedValue when option 2 is selected
              });
            },
          ),
        ),
      ],
    );
  }
}
