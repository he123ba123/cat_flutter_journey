import 'package:cat_flutter_journey/core/utils/common_imports.dart';

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi,Heba', style: AppTextStyles.font20BlackBold),
            Text('How Are you Today?', style: AppTextStyles.font12Regular),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: AppColors.primary400,
          child: Icon(Icons.notifications_none, color: Colors.white),
        ),
      ],
    );
  }
}
