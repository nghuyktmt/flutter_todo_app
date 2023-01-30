import 'package:flutter_todo_app/data/entity/todos_entity.dart';
import 'package:flutter_todo_app/data/mapper/todo_mapper.dart';
import 'package:flutter_todo_app/domain/model/todolist.dart';

class TodoListMapper {
  static TodoList transformToModel(final TodoListEntity entity) {
    final values = entity.map((e) => TodoMapper.transformToModel(e)).toList();
    return TodoList(values: values);
  }

  // static TodoListEntity transformToMap(final TodoList model) {
  //   return model.values.map
  // }
}
