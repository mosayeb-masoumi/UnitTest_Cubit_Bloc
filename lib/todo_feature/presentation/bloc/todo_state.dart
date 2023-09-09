part of 'todo_cubit.dart';

@immutable
abstract class TodoState {
  const TodoState();
}

class TodoInitial extends TodoState {
  const TodoInitial();
}

class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoLoaded extends TodoState {
  final List<dynamic> result;
  const TodoLoaded(this.result);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoLoaded &&
          runtimeType == other.runtimeType &&
          result == other.result;

  @override
  int get hashCode => result.hashCode;
}

class TodoError extends TodoState {
  final String error;
  const TodoError(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoError &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;
}


