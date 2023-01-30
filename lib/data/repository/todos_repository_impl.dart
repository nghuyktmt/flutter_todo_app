import 'package:flutter_todo_app/data/datasource/todos_database.dart';
import 'package:flutter_todo_app/data/datasource/todos_database_impl.dart';
import 'package:flutter_todo_app/data/entity/todos_entity.dart';
import 'package:flutter_todo_app/data/mapper/todo_list_mapper.dart';
import 'package:flutter_todo_app/data/mapper/todo_mapper.dart';
import 'package:flutter_todo_app/domain/model/todolist.dart';
import 'package:flutter_todo_app/domain/model/todoid.dart';
import 'package:flutter_todo_app/domain/model/todo.dart';
import 'package:flutter_todo_app/domain/repository/todos_repository.dart';

class TodosRepositoryImpl implements TodosRepository {
  final TodosDatabase database;

  TodosRepositoryImpl(this.database);

  @override
  Future<Todo> createTodo(String title, String description, bool isCompleted,
      DateTime dueDate) async {
    final todoEntity = await database.insertTodo(
        TodoMapper.transformToNewEntityMap(
            title, description, isCompleted, dueDate));
    return TodoMapper.transformToModel(todoEntity);
  }

  @override
  Future<void> deleteTodo(TodoId id) async {
    await database.deleteTodo(id.value);
  }

  @override
  Future<TodoList> getTodoList() async {
    final todoListEntity = await database.allTodos();
    return TodoListMapper.transformToModel(todoListEntity);
  }

  @override
  Future<void> updateTodo(TodoId id, String title, String description,
      bool isCompleted, DateTime dueDate) async {
    final todo = Todo(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted,
        dueDate: dueDate);
    await database.updateTodo(TodoMapper.transformToMap(todo));
  }
}
