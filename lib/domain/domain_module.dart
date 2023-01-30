import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/data/data_module.dart';
import 'package:flutter_todo_app/domain/usecase/create_todo_usecase.dart';
import 'package:flutter_todo_app/domain/usecase/create_todo_usecase_impl.dart';
import 'package:flutter_todo_app/domain/usecase/delete_todo_usecase.dart';
import 'package:flutter_todo_app/domain/usecase/delete_todo_usecase_impl.dart';
import 'package:flutter_todo_app/domain/usecase/get_todo_list_usecase.dart';
import 'package:flutter_todo_app/domain/usecase/update_todo_usecase.dart';

final getTodoListUseCaseProvider = Provider<GetListTodoUseCase>(
    (ref) => GetListTodoUseCaseImpl(ref.watch(todosRepositoryProvider)));
final createTodoUseCaseProvider = Provider<CreateTodoUseCase>(
    ((ref) => CreateTodoUseCaseImpl(ref.watch(todosRepositoryProvider))));
final updateTodoUseCaseProvider = Provider<UpdateTodoUseCase>(
    ((ref) => UpdateTodoUseCasempl(ref.watch(todosRepositoryProvider))));
final deleteTodoUseCaseProvider = Provider<DeleteTodoUseCase>(
    ((ref) => DeleteTodoUseCaseImpl(ref.watch(todosRepositoryProvider))));
