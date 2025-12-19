import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:flutter/material.dart';

class FilterDropdown extends StatelessWidget {
  final List<String> category;
  final String selectedCategory;
  final Function(String) onCategoryChanged;
  const FilterDropdown({
    super.key,
    required this.category,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        border: Border.all(color: Palette.borderColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: DropdownButton<String>(
          hint: const Text('select Month'),
          value: selectedCategory,
          //itemHeight: 10,
          onChanged: (String? value) {
            if (value != null) {
              onCategoryChanged(value);
            }
          },
          items: category.map<DropdownMenuItem<String>>((String val) {
            return DropdownMenuItem(
              value: val,
              child: Text(
                val.characters.elementAt(0).toUpperCase() + val.substring(1),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
