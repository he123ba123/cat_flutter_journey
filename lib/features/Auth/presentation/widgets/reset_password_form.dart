import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/Auth/logic/reset_password/cubit/reset_password_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is Success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Reset password link sent to your email'),
            ),
          );

          context.push(Routes.signin);
        } else if (state is Error) {
          showDialog(
            context: context,
            builder: (_) => CustomErrorWidget(message: state.error),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: context.read<ResetPasswordCubit>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Address',
                style: AppTextStyles.font15Bold.copyWith(
                  color: AppColors.grey800,
                  fontSize: 13,
                ),
              ),
              8.ph,
              CustomTextFormField(
                controller: context.read<ResetPasswordCubit>().emailController,
                hintText: 'example@email.com',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.primary100.withValues(alpha: 0.7),
                  size: 20.sp,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              32.ph,
              CustomButton(
                onPressed: state is Loading
                    ? null
                    : () {
                        if (context
                            .read<ResetPasswordCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          context.read<ResetPasswordCubit>().resetPassword();
                        }
                      },
                child: Text(
                  'Send Reset Link',
                  style: AppTextStyles.font15RegularWhite.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              24.ph,
              Center(
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: RichText(
                    text: TextSpan(
                      text: 'Remembered your password? ',
                      style: AppTextStyles.font15RegularGrey,
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: AppTextStyles.font15Bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
