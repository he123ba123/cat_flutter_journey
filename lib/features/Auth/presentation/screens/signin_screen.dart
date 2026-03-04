import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/Auth/logic/sign_in/cubit/sign_in_cubit.dart';
import 'package:cat_flutter_journey/features/Auth/presentation/widgets/auth_header_section.dart';
import 'package:cat_flutter_journey/features/Auth/presentation/widgets/text_form_fields_and_button_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeaderSection(title: 'Sign In'),
                TextFormFieldsAndButtonSignIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
