import 'package:flutter_todo_app/domain/model/todoid.dart';
import 'package:flutter_todo_app/domain/repository/todos_repository.dart';
import 'package:flutter_todo_app/domain/usecase/delete_todo_usecase.dart';

class DeleteTodoUseCaseImpl implements DeleteTodoUseCase {
  final TodosRepository _repository;

  DeleteTodoUseCaseImpl(this._repository);

  @override
  Future<void> execute(TodoId id) {
    return _repository.deleteTodo(id);
  }
}
