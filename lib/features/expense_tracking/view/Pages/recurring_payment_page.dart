import 'package:flutter/material.dart';

class RecurringPaymentPage extends StatefulWidget {
  const RecurringPaymentPage({super.key});

  @override
  State<RecurringPaymentPage> createState() => _RecurringPaymentPageState();
}

class _RecurringPaymentPageState extends State<RecurringPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Recurring Payment Page")));
  }
}
