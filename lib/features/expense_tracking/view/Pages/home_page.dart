import 'package:expense_tracker_app/features/expense_tracking/view/Pages/recurring_payment_page.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/Pages/transactions_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  final List<Widget> pages = [TransactionsPage(), RecurringPaymentPage()];

  void onTap(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.settings, color: Colors.grey)),
      body: Center(child: pages[currentPage]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: "Transcations",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_sync_outlined),
            label: "Recurring Payment",
          ),
        ],
        currentIndex: currentPage,
        onTap: onTap,
      ),
    );
  }
}
