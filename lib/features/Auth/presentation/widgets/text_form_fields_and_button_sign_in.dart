import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/Auth/logic/sign_in/cubit/sign_in_cubit.dart';

class TextFormFieldsAndButtonSignIn extends StatelessWidget {
  const TextFormFieldsAndButtonSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is Success) {
          context.pushReplacement(Routes.todo);
        } else if (state is Error) {
          showDialog(
            context: context,
            builder: (_) => CustomErrorWidget(message: state.error),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: context.read<SignInCubit>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextFormField(
                controller: context.read<SignInCubit>().emailController,
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
                controller: context.read<SignInCubit>().passwordController,
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
              GestureDetector(
                onTap: () => context.push(Routes.resetPassword),
                child: Text(
                  "Forgot Password?",
                  style: AppTextStyles.font15Bold,
                ),
              ),
              50.ph,
              state is Loading
                  ? const LoadingWidget()
                  : CustomButton(
                      onPressed: () {
                        if (context
                            .read<SignInCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          context
                              .read<SignInCubit>()
                              .signInWithEmailAndPassword();
                        }
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
          ),
        );
      },
    );
  }
}
