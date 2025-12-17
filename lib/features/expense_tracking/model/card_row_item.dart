import 'package:flutter/material.dart';

class CardRowItem {
  final String label;
  final double value;
  final IconData icon;

  const CardRowItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}
