import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/Auth/logic/reset_password/cubit/reset_password_cubit.dart';
import 'package:cat_flutter_journey/features/Auth/presentation/widgets/reset_password_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                100.ph,
                Center(
                  child: Container(
                    width: 100.w,
                    height: 100.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.primary100.withValues(alpha: 0.12),
                          AppColors.primary200.withValues(alpha: 0.04),
                        ],
                      ),
                      border: Border.all(
                        color: AppColors.primary100.withValues(alpha: 0.20),
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.lock_reset_rounded,
                      size: 46.sp,
                      color: AppColors.primary100,
                    ),
                  ),
                ),

                32.ph,
                Text('Reset Password', style: AppTextStyles.font30Bold),
                10.ph,
                Text(
                  'Enter your registered email address and we\'ll send you a link to reset your password.',
                  style: AppTextStyles.font15RegularGrey,
                ),
                32.ph,
                const ResetPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
