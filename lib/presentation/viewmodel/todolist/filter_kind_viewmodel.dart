import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterKine { all, completed, incomplete }

final filterKindViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<FilterKindViewModel, FilterKine>(
        (ref) => FilterKindViewModel());

class FilterKindViewModel extends StateNotifier<FilterKine> {
  FilterKindViewModel() : super(FilterKine.all);
  filterByAll() => state = FilterKine.all;

  filterByCompleted() => state = FilterKine.completed;

  filterByInComplete() => state = FilterKine.incomplete;

  bool isFilteredByAll() => state == FilterKine.all;
  bool isFilteredByCompleted() => state == FilterKine.completed;
  bool isFilteredByInCompleted() => state == FilterKine.incomplete;
}
