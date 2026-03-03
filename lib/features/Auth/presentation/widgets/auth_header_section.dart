import 'package:cat_flutter_journey/core/helpers/extensions.dart';
import 'package:cat_flutter_journey/core/theme/app_texts/app_text_styles.dart';
import 'package:cat_flutter_journey/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeaderSection extends StatelessWidget {
  final String title;
  const AuthHeaderSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(AppImages.logoImage, height: 200.h, width: 200.w),
        ),
        Text(
          title,
          style: AppTextStyles.font30Bold,
          textAlign: TextAlign.start,
        ),
        20.ph,
      ],
    );
  }
}
