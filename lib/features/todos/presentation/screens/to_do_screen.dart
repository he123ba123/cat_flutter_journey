import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/todos/presentation/widgets/app_bar.dart';
import 'package:cat_flutter_journey/features/todos/presentation/widgets/todo_card_list.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            10.ph,
            TodoCardList(),
            CustomButton(
              onPressed: () {},
              title: 'Add To Do',
              color: AppColors.primary100,
              textColor: AppColors.background,
            ),
            40.ph,
          ],
        ),
      ),
    );
  }
}
