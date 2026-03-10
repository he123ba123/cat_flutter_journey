import 'package:cat_flutter_journey/core/theme/app_colors/light_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_fonts.dart';
import 'font_weight_helper.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle font15Bold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: AppFonts.cairo,
    letterSpacing: 0.5.sp,
    color: AppColors.primary100,
  );

  static TextStyle font30Bold = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: AppFonts.cairo,
    letterSpacing: 0.5.sp,
    color: AppColors.primary100,
  );
  static TextStyle font15Regular = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.cairo,
    letterSpacing: 0.5.sp,
    color: AppColors.primary100,
  );

  static TextStyle font15RegularWhite = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.cairo,
    letterSpacing: 0.5.sp,
    color: AppColors.white,
  );

  static TextStyle font15RegularGrey = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.cairo,
    letterSpacing: 0.5.sp,
    color: AppColors.grey600,
  );

  static TextStyle font20Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: AppFonts.cairo,
    letterSpacing: 0.5.sp,
    color: AppColors.primary100,
  );
}
