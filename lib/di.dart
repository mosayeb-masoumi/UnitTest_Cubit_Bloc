
import 'package:flutter_testing_examle/todo_feature/data/data_source/todo_data_source.dart';
import 'package:flutter_testing_examle/todo_feature/data/repository_impl/todo_repository_impl.dart';
import 'package:flutter_testing_examle/todo_feature/domain/repository/todo_repository.dart';
import 'package:flutter_testing_examle/todo_feature/domain/usecase/todo_usecase.dart';
import 'package:flutter_testing_examle/todo_feature/presentation/bloc/todo_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void setUpDI(){

  // todo_feature
  sl.registerLazySingleton<TodoDataSource>(() => ITodoDataSource());
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));
  sl.registerLazySingleton<TodoUseCase>(() => TodoUseCase(sl()));
  sl.registerLazySingleton<TodoCubit>(() => TodoCubit(sl()));
}