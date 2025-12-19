import 'package:expense_tracker_app/features/expense_tracking/model/transaction.dart';
import 'package:expense_tracker_app/features/expense_tracking/repositories/hive_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_viewmodel.g.dart';

@riverpod
class TransactionNotifier extends _$TransactionNotifier {
  final HiveRepository _repository = HiveRepository();

  @override
  Future<List<Transaction>> build() async {
    return await _repository.getTransactions();
  }

  void addTransaction(Transaction transaction) async {
    await _repository.addTransaction(transaction);
    final prev = state.value ?? [];
    state = AsyncData([...prev, transaction]);
  }

  void deleteTransaction(Transaction transaction) async {
    await _repository.deleteTransaction(transaction);
    final prev = state.value ?? [];
    state = AsyncData(prev.where((t) => t.id != transaction.id).toList());
  }

  void updateTransaction(String id, Transaction transaction) async {
    await _repository.updateTransaction(id, transaction);
    var prev = state.value ?? [];
    /*prev = [ ( for(int i = 0; i<prev.length; i++){
        if(prev[i].id == id){
          transaction
        }
        else{
          prev[i]
        }
      }).toList()  ];*/

    prev = prev.map((e) {
      return e.id == id ? transaction : e;
    }).toList();
    state = AsyncData(prev);
  }
}

@riverpod
List<double> total(ref) {
  double income = 0, expense = 0;
  final AsyncValue<List<Transaction>> asyncTransactions = ref.watch(
    transactionNotifierProvider,
  );
  final transactions = asyncTransactions.valueOrNull ?? [];
  for (Transaction transaction in transactions) {
    if (transaction.type == TransactionType.income) {
      income += transaction.value;
    } else {
      expense += transaction.value;
    }
  }
  return ([income, expense]);
}
