// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totalHash() => r'dff0a9b0a765ded315a5109166fae3ffeeeabeb5';

/// See also [total].
@ProviderFor(total)
final totalProvider = AutoDisposeProvider<List<double>>.internal(
  total,
  name: r'totalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$totalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TotalRef = AutoDisposeProviderRef<List<double>>;
String _$transactionNotifierHash() =>
    r'423c9072dfc5b62f2e3bf0336a2951738171d177';

/// See also [TransactionNotifier].
@ProviderFor(TransactionNotifier)
final transactionNotifierProvider = AutoDisposeAsyncNotifierProvider<
    TransactionNotifier, List<Transaction>>.internal(
  TransactionNotifier.new,
  name: r'transactionNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransactionNotifier = AutoDisposeAsyncNotifier<List<Transaction>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
