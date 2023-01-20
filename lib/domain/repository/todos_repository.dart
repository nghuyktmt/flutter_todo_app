import 'package:flutter_todo_app/domain/model/todo.dart';
import 'package:flutter_todo_app/domain/model/todoid.dart';
import 'package:flutter_todo_app/domain/model/todolist.dart';

abstract class TodosRepository {
  Future<TodoList> getTodoList();
  Future<Todo> createTodo(final String title, final String description,
      final bool isCompleted, final DateTime dueDate);
  Future<void> updateTodo(final TodoId id, final String title,
      final String description, final bool isCompleted, final DateTime dueDate);

  Future<void> deleteTodo(final TodoId id);
}
