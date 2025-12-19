// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totalHash() => r'7e4892f85c731b427811c97f6418ac52c34b92d0';

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
    r'ae5eb11352ae2365ec996c00f7fc3e6aab969110';

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
