import 'package:flutter_todo_app/domain/model/todo.dart';
import 'package:flutter_todo_app/domain/repository/todos_repository.dart';
import 'package:flutter_todo_app/domain/usecase/create_todo_usecase.dart';

class CreateTodoUseCaseImpl implements CreateTodoUseCase {
  final TodosRepository _repository;

  CreateTodoUseCaseImpl(this._repository);

  @override
  Future<Todo> execute(
      String title, String description, bool isCompleted, DateTime dueDate) {
    return _repository.createTodo(title, description, isCompleted, dueDate);
  }
}
