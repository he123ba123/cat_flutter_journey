import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_fonts.dart';
import 'font_weight_helper.dart';

class AppTextStyles {
  const AppTextStyles._();

  // ---------- Font 12 sizes ----------
  static TextStyle font12Regular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.cairo,
    letterSpacing: 0.5.sp,
  );


  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.cairo,
    letterSpacing: 0.5.sp,
  );

  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: AppFonts.cairo,
    letterSpacing: 0.5.sp,
  );

  static TextStyle font16BlackRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.cairo,
    letterSpacing: 0.5.sp,
  );  

  static TextStyle font14BlackRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.cairo,
    letterSpacing: 0.5.sp,
  );
}
