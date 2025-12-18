import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> category;
  const CustomDropdown({super.key, required this.category});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedCategory;
  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category[0];
  }

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
          value: selectedCategory,
          //itemHeight: 10,
          onChanged: (String? newvalue) {
            setState(() {
              selectedCategory = newvalue;
            });
          },
          items: widget.category.map<DropdownMenuItem<String>>((String val) {
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
