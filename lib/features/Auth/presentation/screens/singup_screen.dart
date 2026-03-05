import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/Auth/logic/sign_up/cubit/sign_up_cubit.dart';
import 'package:cat_flutter_journey/features/Auth/presentation/widgets/auth_header_section.dart';
import 'package:cat_flutter_journey/features/Auth/presentation/widgets/text_form_fields_and_button_sign_up.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthHeaderSection(title: 'Sign Up'),
                  TextFormFieldsAndButtonSignUp(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
