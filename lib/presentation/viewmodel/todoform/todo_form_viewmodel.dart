import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/domain/model/todo.dart';
import 'package:flutter_todo_app/domain/model/todoid.dart';
import 'package:flutter_todo_app/presentation/viewmodel/todolist/todo_list_viewmodel.dart';

final todoFormViewModelProvider =
    Provider.autoDispose.family<TodoFormViewModel, Todo?>((ref, arg) {
  final todoListViewModel =
      ref.watch(todoListViewModelStateNotifierProvider.notifier);
  return TodoFormViewModel(arg, todoListViewModel);
});

class TodoFormViewModel {
  late TodoId _id;
  final TodoListViewModel _todoListViewModel;
  var _title = "";
  var _description = "";
  var _isCompleted = false;
  var _dueDate = DateTime.now();
  var _isNewTodo = false;

  TodoFormViewModel(final Todo? todo, this._todoListViewModel) {
    _initTodo(todo);
  }

  void _initTodo(Todo? todo) {
    if (todo == null) {
      _isNewTodo = true;
    } else {
      _id = todo.id;
      _description = todo.description;
      _title = todo.title;
      _isCompleted = todo.isCompleted;
      _dueDate = todo.dueDate;
    }
  }

  createOrUpdateTodo() {
    if (_isNewTodo) {
      _todoListViewModel.addTodo(_title, _description, _isCompleted, _dueDate);
    } else {
      final newTodo = Todo(
          id: _id,
          title: _title,
          description: _description,
          isCompleted: _isCompleted,
          dueDate: _dueDate);
      _todoListViewModel.updateTodo(newTodo);
    }
  }

  deleteTodo() {
    if (!_isNewTodo) {
      _todoListViewModel.deleteTodo(_id);
    }
  }

  String appBarTitle() => _isNewTodo ? 'Add Todo' : 'Edit Todo';
  String initialTitleValue() => _title;
  String initialDescriptionValue() => _description;
  DateTime initialDueDateValue() => _dueDate;
  DateTime datePickerFirstDate() => DateTime(DateTime.now().year - 5, 1, 1);
  DateTime datePickerLastDate() => DateTime(DateTime.now().year + 5, 12, 31);
  bool shouldShowDeleteTodoIcon() => !_isNewTodo;

  setTitle(final String value) => _title = value;
  setDescription(final String value) => _description = value;
  setTodoStatus(final bool value) => _isCompleted = value;
  setDueDate(final DateTime value) => _dueDate = value;

  String? validateTitle() {
    if (_title.isEmpty) {
      return 'Enter a title.';
    } else if (_title.length > 20) {
      return 'Limit the title to 20 character';
    } else {
      return null;
    }
  }

  String? validateDescription() {
    if (_description.length > 100) {
      return 'Limit the description to 100 characters.';
    } else {
      return null;
    }
  }

  String? validateDueDate() {
    if (_isNewTodo && _dueDate.isBefore(DateTime.now())) {
      return "DueDate must be after today's date.";
    } else {
      return null;
    }
  }
}
