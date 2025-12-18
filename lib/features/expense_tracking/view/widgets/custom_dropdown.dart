import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> category;
  final TransactionCategory selectedCategory;
  final Function(TransactionCategory) onCategoryChanged;
  const CustomDropdown({
    super.key,
    required this.category,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Palette.borderColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: DropdownButton<String>(
          hint: Text('select category'),
          value: selectedCategory.name,
          //itemHeight: 10,
          onChanged: (String? value) {
            if (value != null) {
              onCategoryChanged(TransactionCategory.values.byName(value));
            }
          },
          items: category.map<DropdownMenuItem<String>>((String val) {
            return DropdownMenuItem(
              value: val,
              child: Text(
                val.characters.elementAt(0).toUpperCase() + val.substring(1),
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
