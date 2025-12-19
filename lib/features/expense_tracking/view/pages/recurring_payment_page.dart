import 'package:flutter/material.dart';

class RecurringPaymentPage extends StatefulWidget {
  const RecurringPaymentPage({super.key});

  @override
  State<RecurringPaymentPage> createState() => _RecurringPaymentPageState();
}

class _RecurringPaymentPageState extends State<RecurringPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [FloatingActionButton(onPressed: () {})]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
