import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cat_flutter_journey/features/todos/data/models/todo_model.dart';

part 'todos_state.freezed.dart';

@freezed
class TodosState with _$TodosState {
  const factory TodosState.initial() = _Initial;
  const factory TodosState.loading() = Loading;
  const factory TodosState.success(List<TodoModel> todos) = Success;
  const factory TodosState.error(String error) = Error;
}
