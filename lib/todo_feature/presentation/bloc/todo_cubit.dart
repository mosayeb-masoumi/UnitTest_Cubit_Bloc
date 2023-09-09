import 'package:bloc/bloc.dart';
import 'package:flutter_testing_examle/todo_feature/domain/usecase/todo_usecase.dart';
import 'package:meta/meta.dart';


part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoUseCase _useCase;
  TodoCubit(this._useCase) : super(const TodoInitial());


  Future<dynamic> getTodoList() async {
    try{
      emit(const TodoLoading());
      var result = await _useCase.getTodoList();
      emit(TodoLoaded(result));
    }catch(e){
      emit(TodoError(e.toString()));
    }
  }
}
