
import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DialogType { success, error }

class CustomStatusDialog extends StatelessWidget {
  final String title;
  final String message;
  final DialogType type;
  final VoidCallback? onPressed;
  final String? buttonText;

  const CustomStatusDialog({
    super.key,
    required this.title,
    required this.message,
    required this.type,
    this.onPressed,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final isSuccess = type == DialogType.success;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animated Icon Container
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSuccess
                    ? Colors.green.withValues(alpha: 0.1)
                    : Colors.red.withValues(alpha: 0.1),
              ),
              child: Icon(
                isSuccess ? Icons.check_circle : Icons.error,
                size: 50.sp,
                color: isSuccess ? Colors.green : Colors.red,
              ),
            ),
            20.ph,
            // Title
            Text(
              title,
              style: AppTextStyles.font20BlackBold,
              textAlign: TextAlign.center,
            ),
            12.ph,

            // Message
            Text(
              message,
              style: AppTextStyles.font14BlackRegular,
              textAlign: TextAlign.center,
            ),
            24.ph,

            // Button
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: onPressed ?? () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSuccess ? Colors.green : Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  buttonText ?? 'OK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to show success dialog
  static void showSuccess({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onPressed,
    String? buttonText,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomStatusDialog(
        title: title,
        message: message,
        type: DialogType.success,
        onPressed: onPressed,
        buttonText: buttonText,
      ),
    );
  }

  // Helper method to show error dialog
  static void showError({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onPressed,
    String? buttonText,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomStatusDialog(
        title: title,
        message: message,
        type: DialogType.error,
        onPressed: onPressed,
        buttonText: buttonText,
      ),
    );
  }
}
