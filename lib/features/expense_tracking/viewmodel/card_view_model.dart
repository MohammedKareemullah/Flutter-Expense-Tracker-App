import 'package:expense_tracker_app/features/expense_tracking/model/card_row_item.dart';
import 'package:flutter/material.dart';

class CardViewModel {
  List<CardRowItem> items = [
    CardRowItem(icon: Icons.savings_outlined, label: "Income", value: 112.3),
    CardRowItem(icon: Icons.wallet, label: "Expense", value: 84.1),
  ];
}
