import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/custom_button.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/custom_dropdown.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/custom_field.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/custom_radio.dart';
import 'package:expense_tracker_app/features/expense_tracking/view/widgets/snack_bar.dart';
import 'package:expense_tracker_app/features/expense_tracking/viewmodel/transaction_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTransaction extends ConsumerStatefulWidget {
  final String id;
  final String title;
  final double value;
  final TransactionType type;
  final TransactionCategory category;
  final bool isEdited;
  const AddTransaction({
    super.key,
    this.title = "",
    this.value = 0,
    this.type = TransactionType.expense,
    this.category = TransactionCategory.other,
    this.id = "",
    required this.isEdited,
  });

  @override
  ConsumerState<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends ConsumerState<AddTransaction> {
  final titlecontroller = TextEditingController();
  final valueController = TextEditingController();
  TransactionType selectedType = TransactionType.expense;
  TransactionCategory selectedCategory = TransactionCategory.other;
  final bool isEmpty = false;

  Transaction? storeContent() {
    if (titlecontroller.text == '' || valueController.text == '') {
      return null;
    }
    return Transaction.create(
      title: titlecontroller.text,
      value: double.parse(valueController.text),
      type: selectedType,
      category: selectedCategory,
    );
  }

  List<String> categories = TransactionCategory.values
      .map((e) => e.name.toString())
      .toList();

  @override
  Widget build(BuildContext context) {
    (widget.isEdited) ? (titlecontroller.text = widget.title) : '';
    (widget.isEdited) ? (valueController.text = widget.value.toString()) : '';
    Transaction? newValue;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SizedBox(height: 40),
            const Text(
              "Add Transaction",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 40),
            CustomField(
              hintText: "Transaction title",
              controller: titlecontroller,
              isNum: false,
            ),
            const SizedBox(height: 40),
            CustomField(
              hintText: "Amount (in ₹)",
              controller: valueController,
              isNum: true,
            ),
            const SizedBox(height: 40),
            CustomRadio(
              radioText1: "Income",
              radioText2: "Expense",
              selectedType: widget.isEdited ? widget.type : selectedType,
              onTypeChanged: (val) {
                setState(() {
                  selectedType = val;
                });
              },
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    "Category",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  CustomDropdown(
                    category: categories,
                    selectedCategory: widget.isEdited
                        ? widget.category
                        : selectedCategory,
                    onCategoryChanged: (val) {
                      setState(() {
                        selectedCategory = val;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),
            Center(
              child: CustomButton(
                onTap: () {
                  newValue = storeContent();
                  if (newValue == null) {
                    showSnackBar(
                      context,
                      "Title and Value Field cannot be empty",
                    );
                  } else {
                    widget.isEdited
                        ? (ref
                              .read(transactionNotifierProvider.notifier)
                              .updateTransaction(widget.id, newValue!))
                        : (ref
                              .read(transactionNotifierProvider.notifier)
                              .addTransaction(newValue!));
                    titlecontroller.clear();
                    valueController.clear();
                    Navigator.of(context).pop();
                  }

                  setState(() {});
                },
                text: widget.isEdited ? "Update" : "Add",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
