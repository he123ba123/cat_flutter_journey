import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/todos/logic/todos_cubit.dart';
import 'package:cat_flutter_journey/features/todos/presentation/widgets/add_edit_todo_dialog.dart';
import 'package:cat_flutter_journey/features/todos/presentation/widgets/app_bar.dart';
import 'package:cat_flutter_journey/features/todos/presentation/widgets/todo_card_list.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              10.ph,
              const TodoCardList(),
              Builder(
                builder: (context) {
                  return CustomButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) => BlocProvider.value(
                          value: context.read<TodosCubit>(),
                          child: const AddEditTodoDialog(),
                        ),
                      );
                    },
                    title: 'Add To Do',
                    color: AppColors.primary100,
                    textColor: AppColors.background,
                  );
                }
              ),
              40.ph,
            ],
          ),
        ),
      ),
    );
  }
}
