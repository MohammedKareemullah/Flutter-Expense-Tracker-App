import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Palette.gradient1, Palette.gradient2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: (onTap),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 80),
          shadowColor: Palette.transparentColor,
          backgroundColor: Palette.transparentColor,
        ),
        child: Text(text, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
