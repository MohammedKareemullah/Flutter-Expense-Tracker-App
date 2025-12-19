import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/Pages/add_transaction.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/Pages/home_page.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/pages/analytics_page.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/pages/recurring_payment_page.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/pages/transactions_page.dart';
import 'package:expense_tracker_app/features/expense_tracking/viewmodel/nav_index_provider.dart';
import 'package:expense_tracker_app/features/expense_tracking/viewmodel/transaction_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int currentPage = 0;
  void onTap(int index) {
    setState(() {
      ref.read(navIndexProvider.notifier).state = index;
      ref.watch(transactionNotifierProvider);
    });
  }

  final List<Widget> pages = [
    const HomePage(),
    const TransactionsPage(),
    const AnalyticsPage(),
    const RecurringPaymentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(navIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "THE BUDGETTER ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.account_circle_outlined,
              color: Colors.grey,
              size: 30,
            ),
          ),
        ],
        elevation: 4,
      ),
      body: Center(child: pages[currentIndex]),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddTransaction(isEdited: false),
              ),
            );
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
              const SizedBox(width: 40),
              buildNavItem(Icons.analytics_outlined, "Analytics", 2),
              buildNavItem(Icons.currency_exchange_outlined, "recurring", 3),
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
    final currentIndex = ref.watch(navIndexProvider);
    final isSelected = pos == currentIndex;
    return InkWell(
      onTap: () => onTap(pos),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
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
