import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:flutter/material.dart';

class Apptheme {
  final theme = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Palette.backgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: Palette.backgroundColor),

    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Product'),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 30, color: Palette.primaryBlack),
      unselectedIconTheme: IconThemeData(size: 30, color: Palette.greyColor),
      backgroundColor: Palette.backgroundColor,
      selectedLabelStyle: TextStyle(color: Palette.primaryBlack, fontSize: 15),
      unselectedLabelStyle: TextStyle(color: Palette.greyColor, fontSize: 15),
    ),
  );

  final customTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w900);
}
