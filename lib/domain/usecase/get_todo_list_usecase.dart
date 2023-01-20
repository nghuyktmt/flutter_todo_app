import 'package:flutter_todo_app/domain/model/todolist.dart';
import 'package:flutter_todo_app/domain/repository/todos_repository.dart';

abstract class GetListTodoUseCase {
  Future<TodoList> execute();
}

class GetListTodoUseCaseImpl implements GetListTodoUseCase {
  final TodosRepository _repository;

  GetListTodoUseCaseImpl(this._repository);

  @override
  Future<TodoList> execute() {
    return _repository.getTodoList();
  }
}
