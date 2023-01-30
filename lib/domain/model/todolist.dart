import 'package:flutter_todo_app/domain/model/todo.dart';
import 'package:flutter_todo_app/domain/model/todoid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todolist.freezed.dart';

@freezed
class TodoList with _$TodoList {
  const factory TodoList({required List<Todo> values}) = _TodoList;

  const TodoList._();

  operator [](final int index) => values[index];

  int get lenght => values.length;

  TodoList addTodo(final Todo todo) => copyWith(values: [...values, todo]);

  TodoList updateTodo(final Todo newTodo) {
    return copyWith(
        values: values.map((e) => newTodo.id == e.id ? newTodo : e).toList());
  }

  TodoList removeTodoById(final TodoId id) =>
      copyWith(values: values.where((element) => id != element.id).toList());

  TodoList filterByComplete() =>
      copyWith(values: values.where((element) => element.isCompleted).toList());

  TodoList filterByIncomplete() => copyWith(
      values: values.where((element) => !element.isCompleted).toList());
}
