import 'package:expense_tracker_app/features/expense_tracking/view/Pages/home_page.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/Pages/recurring_payment_page.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/Pages/transactions_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  void onTap(int index) {
    setState(() {
      currentPage = index;
    });
  }

  final List<Widget> pages = [
    HomePage(),
    TransactionsPage(),
    RecurringPaymentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.settings, color: Colors.grey)),
      body: Center(child: pages[currentPage]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Match your Background Color
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.15,
              ), // The shadow color you wanted
              blurRadius: 10, // Softness
              offset: const Offset(
                0,
                -5,
              ), // Move shadow UP so it sits on top of the body
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
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
          elevation: 23,
        ),
      ),
    );
  }
}
