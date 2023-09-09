import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_examle/todo_feature/data/model/todo_model.dart';
import 'package:flutter_testing_examle/todo_feature/domain/usecase/todo_usecase.dart';
import 'package:flutter_testing_examle/todo_feature/presentation/bloc/todo_cubit.dart';
import 'package:mocktail/mocktail.dart';


class MockTodoUseCase extends Mock implements TodoUseCase {}

void main() {
  group('TodoCubit', () {
    late TodoCubit todoCubit;
    late MockTodoUseCase mockUseCase;

    setUp(() {
      mockUseCase = MockTodoUseCase();
      todoCubit = TodoCubit(mockUseCase);
    });

    tearDown(() {
      todoCubit.close();
    });



    test('emits TodoLoading and TodoLoaded states when getTodoList succeeds', () async {

      // expected
      final todoList = [
        TodoModel(userId: 0, id: 0, title: "title0", completed: true),
        TodoModel(userId: 1, id: 1, title: "title1", completed: true),
        TodoModel(userId: 2, id: 2, title: "title2", completed: true),
      ];
       when(() => mockUseCase.getTodoList()).thenAnswer((_) async => todoList);
       // when(() => mockUseCase.getTodoList()).thenAnswer((_) async => Future.value(todoList)); //actual

      // Act
      await todoCubit.getTodoList();

      // Assert
      expect(todoCubit.state, isA<TodoLoaded>());
      expect((todoCubit.state as TodoLoaded).result, todoList);
    });

    test('emits TodoLoading and TodoError states when getTodoList throws an exception', () async {
      // Arrange
      const error ="Exception: error";   // expected
      when(() => mockUseCase.getTodoList()).thenThrow(Exception("error"));  // actual
      // Act
      await todoCubit.getTodoList();

      // Assert
      expect(todoCubit.state, isA<TodoError>());
      expect((todoCubit.state as TodoError).error, error);
    });
  });
}