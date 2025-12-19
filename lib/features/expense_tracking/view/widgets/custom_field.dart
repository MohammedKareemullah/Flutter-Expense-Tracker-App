import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final bool isNum;
  final bool isDate;
  const CustomField({
    required this.hintText,
    required this.controller,
    required this.isNum,
    this.onTap,
    required this.isDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      keyboardType: (isNum
          ? const TextInputType.numberWithOptions()
          : (isDate ? TextInputType.datetime : TextInputType.none)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      validator: (val) {
        if (val!.trim().isEmpty) {
          return '$hintText can\'t be empty';
        } else {
          return null;
        }
      },
    );
  }
}
