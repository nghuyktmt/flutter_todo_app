import 'package:flutter_todo_app/data/entity/todos_entity.dart';
import 'package:flutter_todo_app/domain/model/todo.dart';
import 'package:flutter_todo_app/domain/model/todoid.dart';

class TodoMapper{
  static Todo transformToModel(final TodoEntity entity) {
    return Todo(id: TodoId(value: entity['id']), title: title, description: description, isCompleted: isCompleted, dueDate: dueDate)
  }
}