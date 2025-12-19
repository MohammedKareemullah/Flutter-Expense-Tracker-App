import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nav_index_provider.g.dart';

@riverpod
class NavIndex extends _$NavIndex {
  @override
  int build() => 0;

  void setIndex(int index) {
    state = index;
  }
}
