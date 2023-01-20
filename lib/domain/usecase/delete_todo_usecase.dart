import 'package:flutter_todo_app/domain/model/todoid.dart';

abstract class DeleteTodoUseCase {
  Future<void> execute(final TodoId id);
}
