import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/domain/domain_module.dart';
import 'package:flutter_todo_app/domain/model/todo.dart';
import 'package:flutter_todo_app/domain/model/todoid.dart';
import 'package:flutter_todo_app/domain/model/todolist.dart';
import 'package:flutter_todo_app/domain/usecase/create_todo_usecase.dart';
import 'package:flutter_todo_app/domain/usecase/delete_todo_usecase.dart';
import 'package:flutter_todo_app/domain/usecase/get_todo_list_usecase.dart';
import 'package:flutter_todo_app/domain/usecase/update_todo_usecase.dart';
import 'package:flutter_todo_app/presentation/state/state.dart';
import 'package:flutter_todo_app/presentation/viewmodel/todolist/filter_kind_viewmodel.dart';

final filteredTodoListProvider = Provider.autoDispose<State<TodoList>>((ref) {
  final filterKind = ref.watch(filterKindViewModelStateNotifierProvider);
  final todoListState = ref.watch(todoListViewModelStateNotifierProvider);
  return todoListState.when(
      init: () => const State.init(),
      loading: () => const State.loading(),
      success: (data) {
        switch (filterKind) {
          case FilterKine.all:
            return State.success(data);
          case FilterKine.completed:
            return State.success(data.filterByComplete());
          case FilterKine.incomplete:
            return State.success(data.filterByIncomplete());
        }
      },
      error: (exception) => State.error(exception));
});

final todoListViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<TodoListViewModel, State<TodoList>>(
        (ref) => TodoListViewModel(
            ref.watch(getTodoListUseCaseProvider),
            ref.watch(createTodoUseCaseProvider),
            ref.watch(updateTodoUseCaseProvider),
            ref.watch(deleteTodoUseCaseProvider)));

class TodoListViewModel extends StateNotifier<State<TodoList>> {
  final GetListTodoUseCase _getListTodoUseCase;
  final CreateTodoUseCase _createTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  TodoListViewModel(this._getListTodoUseCase, this._createTodoUseCase,
      this._updateTodoUseCase, this._deleteTodoUseCase)
      : super(const State.init()) {
    _getTodoList();
  }

  _getTodoList() async {
    try {
      state = const State.loading();
      final todoList = await _getListTodoUseCase.execute();
      state = State.success(todoList);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  addTodo(final String title, final String description, final bool isCompleted,
      final DateTime dueDate) async {
    try {
      final newTodo = await _createTodoUseCase.execute(
          title, description, isCompleted, dueDate);
      state = State.success(state.data!.addTodo(newTodo));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  updateTodo(final Todo newTodo) async {
    try {
      await _updateTodoUseCase.execute(newTodo.id, newTodo.title,
          newTodo.description, newTodo.isCompleted, newTodo.dueDate);
      state = State.success(state.data!.updateTodo(newTodo));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  deleteTodo(final TodoId id) async {
    try {
      await _deleteTodoUseCase.execute(id);
      state = State.success(state.data!.removeTodoById(id));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  undoTodo(final Todo todo) {
    final newTodo = todo.copyWith(isCompleted: false);
    updateTodo(newTodo);
  }

  completeTodo(final Todo todo) {
    final newTodo = todo.copyWith(isCompleted: true);
    updateTodo(newTodo);
  }
}
