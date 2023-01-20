import 'package:flutter_todo_app/domain/model/todolist.dart';
import 'package:flutter_todo_app/domain/model/todoid.dart';
import 'package:flutter_todo_app/domain/model/todo.dart';
import 'package:flutter_todo_app/domain/repository/todos_repository.dart';

class TodosRepositoryImpl implements TodosRepository {
  @override
  Future<Todo> createTodo(
      String title, String description, bool isCompleted, DateTime dueDate) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(TodoId id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<TodoList> getTodoList() {
    // TODO: implement getTodoList
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo(TodoId id, String title, String description,
      bool isCompleted, DateTime dueDate) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
