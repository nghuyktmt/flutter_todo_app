import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/presentation/viewmodel/todolist/filter_kind_viewmodel.dart';
import 'package:flutter_todo_app/presentation/viewmodel/todolist/todo_list_viewmodel.dart';

class TodoListPage extends StatelessWidget {
  final _filteredTodoListProvider = filteredTodoListProvider;
  final _todoListProvider = todoListViewModelStateNotifierProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: Column(
        children: [ChipsBarWidget()],
      ),
    );
  }
}

class ChipsBarWidget extends StatelessWidget {
  final _provider = filterKindViewModelStateNotifierProvider;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final viewModel = ref.watch(_provider.notifier);
        ref.watch(_provider);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                InputChip(
                  label: const Text('All'),
                  selected: viewModel.isFilteredByAll(),
                  onSelected: (value) => viewModel.filterByAll(),
                  selectedColor:
                      viewModel.isFilteredByAll() ? Colors.lightGreen : null,
                ),
                const SizedBox(
                  width: 8,
                ),
                InputChip(
                  label: const Text('Completed'),
                  selected: viewModel.isFilteredByCompleted(),
                  onSelected: (value) => viewModel.filterByCompleted(),
                  selectedColor: viewModel.isFilteredByCompleted()
                      ? Colors.lightGreen
                      : null,
                ),
                const SizedBox(
                  width: 8,
                ),
                InputChip(
                  label: const Text('Incompleted'),
                  selected: viewModel.isFilteredByInCompleted(),
                  onSelected: (value) => viewModel.filterByInComplete(),
                  selectedColor: viewModel.isFilteredByInCompleted()
                      ? Colors.lightGreen
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
