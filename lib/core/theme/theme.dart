import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:flutter/material.dart';

class Apptheme {
  static OutlineInputBorder border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 3),
    borderRadius: BorderRadius.circular(10),
  );

  final theme = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Palette.backgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: Palette.backgroundColor),

    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Product'),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      enabledBorder: border(Palette.borderColor),
      focusedBorder: border(Palette.borderColor),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 30, color: Palette.primaryBlack),
      unselectedIconTheme: IconThemeData(size: 30, color: Palette.greyColor),
      backgroundColor: Palette.backgroundColor,
      selectedLabelStyle: TextStyle(color: Palette.primaryBlack, fontSize: 15),
      unselectedLabelStyle: TextStyle(color: Palette.greyColor, fontSize: 15),
    ),
  );

  final customTextStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
