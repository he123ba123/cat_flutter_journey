import 'package:cat_flutter_journey/core/utils/common_imports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(
            icon: Icon(Icons.person, color: AppColors.background),
            onPressed: () {
              context.push(Routes.home);
            },
          ),
        ),
      ],
      centerTitle: true,
      backgroundColor: AppColors.primary100,
      title: Text(
        'To Do',
        style: AppTextStyles.font20Bold.copyWith(color: AppColors.background),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
