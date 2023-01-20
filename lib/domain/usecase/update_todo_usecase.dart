import 'package:flutter_todo_app/domain/model/todo.dart';
import 'package:flutter_todo_app/domain/model/todolist.dart';
import 'package:flutter_todo_app/domain/repository/todos_repository.dart';

import '../model/todoid.dart';

abstract class UpdateTodoUseCase {
  Future<void> execute(
    final TodoId id,
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime dueDate,
  );
}

class UpdateTodoUseCasempl implements UpdateTodoUseCase {
  final TodosRepository _repository;

  UpdateTodoUseCasempl(this._repository);

  @override
  Future<void> execute(TodoId id, String title, String description,
      bool isCompleted, DateTime dueDate) {
    return _repository.updateTodo(id, title, description, isCompleted, dueDate);
  }
}
