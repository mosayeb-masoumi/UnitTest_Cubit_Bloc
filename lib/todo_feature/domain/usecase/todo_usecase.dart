import 'package:flutter_testing_examle/todo_feature/domain/repository/todo_repository.dart';

class TodoUseCase extends TodoRepository{
  final TodoRepository _repository;
  TodoUseCase(this._repository);
  @override
  Future getTodoList()  {
    return _repository.getTodoList();
  }
}