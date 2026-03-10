import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoCardList extends StatelessWidget {
  const TodoCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
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
                value: false,
                onChanged: (value) {},
              ),
              title: Text(
                'To Do',
                style: AppTextStyles.font15Bold.copyWith(
                  color: AppColors.primary100,
                ),
              ),
              subtitle: Text(
                'To Do',
                style: AppTextStyles.font15Regular.copyWith(
                  color: AppColors.primary100,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.edit_outlined,
                      color: AppColors.primary200,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.done_all_outlined,
                      color: AppColors.primary200,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_outline, color: AppColors.error500),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
