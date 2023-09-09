import 'package:flutter_testing_examle/todo_feature/data/data_source/todo_data_source.dart';
import 'package:flutter_testing_examle/todo_feature/domain/repository/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {

  final TodoDataSource _dataSource;
  TodoRepositoryImpl(this._dataSource);

  @override
  Future getTodoList() {
    return _dataSource.getTodoList();
  }
}
