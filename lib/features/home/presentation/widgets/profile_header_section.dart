import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeaderSection extends StatelessWidget {
  final String name;
  const ProfileHeaderSection({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppColors.primary100, AppColors.primary200],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: CircleAvatar(
            radius: 48.r,
            backgroundColor: AppColors.grey200,
            backgroundImage: AssetImage(AppImages.logoImage),
          ),
        ),
        16.ph,
        Text(
          name,
          style: AppTextStyles.font30Bold,
          textAlign: TextAlign.center,
        ),
        4.ph,
        Text(
          'Personal Information',
          style: AppTextStyles.font15RegularGrey,
          textAlign: TextAlign.center,
        ),
        24.ph,
      ],
    );
  }
}
