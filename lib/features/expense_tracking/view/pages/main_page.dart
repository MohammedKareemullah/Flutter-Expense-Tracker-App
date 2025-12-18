import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/Pages/add_transaction.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/Pages/home_page.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/pages/recurring_payment_page.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/pages/transactions_page.dart';
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
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => AddTransaction()));
          },
          backgroundColor: Palette.primaryBlack,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white, size: 40),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavItem(Icons.home_outlined, "Home", 0),
              buildNavItem(Icons.receipt_long_outlined, "Transaction", 1),
              SizedBox(width: 40),
              buildNavItem(Icons.currency_exchange_outlined, "Recurring", 2),
              buildNavItem(Icons.person_outline, "Account", 4),
            ],
          ),
          /*items: const <BottomNavigationBarItem>[
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
          elevation: 23,*/
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, String label, int pos) {
    final isSelected = pos == currentPage;
    return InkWell(
      onTap: () => onTap(pos),
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Palette.primaryBlack : Palette.greyColor,
              size: 30,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Palette.primaryBlack : Palette.greyColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
