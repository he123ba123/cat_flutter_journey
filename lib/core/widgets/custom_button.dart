import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Widget? child;
  final Color? color;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.title,
    this.child,
    this.color,
    this.textColor,
  }) : assert(
         title != null || child != null,
         'Either title or child must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primary200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        minimumSize: Size(double.maxFinite, 70.h),
      ),
      child: child ?? Text(title!, style: AppTextStyles.font15RegularWhite),
    );
  }
}
