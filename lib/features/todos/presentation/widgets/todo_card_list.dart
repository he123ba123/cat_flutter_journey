import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/todos/logic/todos_cubit.dart';
import 'package:cat_flutter_journey/features/todos/logic/todos_state.dart';
import 'package:cat_flutter_journey/features/todos/presentation/widgets/add_edit_todo_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoCardList extends StatelessWidget {
  const TodoCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosCubit, TodosState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Expanded(
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (error) => Expanded(
            child: Center(child: Text(error)),
          ),
          success: (todos) {
            if (todos.isEmpty) {
              return const Expanded(
                child: Center(child: Text('No To Dos yet!')),
              );
            }
            return Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Card(
                    shadowColor: AppColors.primary100,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    color: AppColors.background,
                    child: ListTile(
                      leading: Checkbox(
                        side: BorderSide(color: AppColors.primary100),
                        checkColor: AppColors.background,
                        activeColor: AppColors.primary100,
                        value: todo.isCompleted,
                        onChanged: (value) {
                          context.read<TodosCubit>().toggleTodoCompletion(todo.id, todo.isCompleted);
                        },
                      ),
                      title: Text(
                        todo.title,
                        style: AppTextStyles.font15Bold.copyWith(
                          color: AppColors.primary100,
                          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      subtitle: todo.subtitle.isNotEmpty
                          ? Text(
                              todo.subtitle,
                              style: AppTextStyles.font15Regular.copyWith(
                                color: AppColors.primary100,
                                decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                              ),
                            )
                          : null,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit_outlined,
                              color: AppColors.primary200,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (dialogContext) => BlocProvider.value(
                                  value: context.read<TodosCubit>(),
                                  child: AddEditTodoDialog(
                                    id: todo.id,
                                    initialTitle: todo.title,
                                    initialSubtitle: todo.subtitle,
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_outline, color: AppColors.error500),
                            onPressed: () {
                              context.read<TodosCubit>().deleteTodo(todo.id);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          orElse: () => const Expanded(child: SizedBox.shrink()),
        );
      },
    );
  }
}
