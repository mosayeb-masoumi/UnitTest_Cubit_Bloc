import 'package:dio/dio.dart';
import 'package:flutter_testing_examle/core/network.dart';
import 'package:flutter_testing_examle/todo_feature/data/model/todo_model.dart';

abstract class TodoDataSource {
  Future<dynamic> getTodoList();
}

class ITodoDataSource extends TodoDataSource {

  @override
  Future<dynamic> getTodoList() async {

    var dio = DioUtil.getInstance();
    const String apiUrl = ("https://jsonplaceholder.typicode.com/todos/");
    try {
      Response response = await dio!.get(apiUrl);

      if (response.statusCode == 204 || response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        List<TodoModel> todoList = jsonData
            .map<TodoModel>((json) => TodoModel.fromJson(json))
            .toList();
        return todoList;
      } else {
        return "error";
      }
    } on DioError catch (e) {
      // to be detect by cubit class
      throw Exception(e.error.toString());
    }
  }

}