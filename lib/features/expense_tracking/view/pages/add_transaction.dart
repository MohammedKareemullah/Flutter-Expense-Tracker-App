import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:expense_tracker_app/features/expense_tracking/repositories/hive_repository.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/custom_button.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/custom_dropdown.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/custom_field.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/custom_radio.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titlecontroller = TextEditingController();
  final valueController = TextEditingController();
  TransactionType selectedType = TransactionType.expense;
  TransactionCategory selectedCategory = TransactionCategory.other;

  void storeContent() => HiveRepository().addTransaction(
    Transaction.create(
      title: titlecontroller.text,
      value: double.parse(valueController.text),
      type: selectedType,
      category: selectedCategory,
    ),
  );

  List<String> categories = TransactionCategory.values
      .map((e) => e.name.toString())
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SizedBox(height: 40),
            Text(
              "Add Transaction",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 40),
            CustomField(
              hintText: "Transaction title",
              controller: titlecontroller,
              isNum: false,
            ),
            SizedBox(height: 40),
            CustomField(
              hintText: "Amount (in ₹)",
              controller: valueController,
              isNum: true,
            ),
            SizedBox(height: 40),
            CustomRadio(
              radioText1: "Income",
              radioText2: "Expense",
              selectedType: selectedType,
              onTypeChanged: (val) {
                setState(() {
                  selectedType = val;
                });
              },
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  CustomDropdown(
                    category: categories,
                    selectedCategory: selectedCategory,
                    onCategoryChanged: (val) {
                      setState(() {
                        selectedCategory = val;
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 60),
            Center(
              child: CustomButton(
                onTap: () {
                  storeContent();
                  print(HiveRepository().getTransactions());
                },
                text: "Add",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
