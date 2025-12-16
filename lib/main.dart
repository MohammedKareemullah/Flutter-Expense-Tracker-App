import 'package:expense_tracker_app/core/theme/theme.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/Pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Apptheme().theme,

      home: HomePage(),
    );
  }
}
