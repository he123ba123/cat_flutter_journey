import 'package:cat_flutter_journey/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:cat_flutter_journey/core/theme/app_texts/app_text_styles.dart';
import 'package:cat_flutter_journey/core/widgets/custom_button.dart';
import 'package:cat_flutter_journey/core/widgets/custom_text_form_field.dart';
import 'package:cat_flutter_journey/core/helpers/extensions.dart';
import 'package:go_router/go_router.dart';

class TextFormFieldsAndButtonSignIn extends StatelessWidget {
  TextFormFieldsAndButtonSignIn({super.key});
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTextFormField(
          controller: _emailController,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        12.ph,
        CustomTextFormField(
          controller: _passwordController,
          hintText: 'Password',
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
        15.ph,
        Text("Forgot Password?", style: AppTextStyles.font15Bold),
        50.ph,
        CustomButton(
          onPressed: () {
            context.push(Routes.home);
          },
          title: 'Sign In',
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: AppTextStyles.font15Regular,
              textAlign: TextAlign.center,
            ),
            5.pw,
            InkWell(
              onTap: () {
                context.push(Routes.signup);
              },
              child: Text(
                "Sign Up",
                style: AppTextStyles.font15Bold,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
