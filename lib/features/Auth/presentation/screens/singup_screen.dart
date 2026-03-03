import 'package:cat_flutter_journey/core/theme/app_colors/light_app_colors.dart';
import 'package:cat_flutter_journey/features/Auth/presentation/widgets/auth_header_section.dart';
import 'package:cat_flutter_journey/features/Auth/presentation/widgets/text_form_fields_and_button_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthHeaderSection(title: 'Sign Up'),
              TextFormFieldsAndButtonSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
