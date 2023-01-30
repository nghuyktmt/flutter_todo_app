import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/data/datasource/todos_database.dart';
import 'package:flutter_todo_app/data/datasource/todos_database_impl.dart';
import 'package:flutter_todo_app/data/repository/todos_repository_impl.dart';
import 'package:flutter_todo_app/domain/repository/todos_repository.dart';

final todosDatabaseProvider =
    Provider<TodosDatabase>((_) => TodoDatabaseImpl());
final todosRepositoryProvider = Provider<TodosRepository>(
    (ref) => TodosRepositoryImpl(ref.watch(todosDatabaseProvider)));
