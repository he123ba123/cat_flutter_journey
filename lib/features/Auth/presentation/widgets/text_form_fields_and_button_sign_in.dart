import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/Auth/logic/google_sign_in/cubit/google_signin_cubit.dart';
import 'package:cat_flutter_journey/features/Auth/logic/google_sign_in/cubit/google_signin_state.dart'
    as google;
import 'package:cat_flutter_journey/features/Auth/logic/sign_in/cubit/sign_in_cubit.dart';

class TextFormFieldsAndButtonSignIn extends StatelessWidget {
  const TextFormFieldsAndButtonSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleSigninCubit, google.GoogleSigninState>(
      listener: (context, googleState) {
        googleState.maybeWhen(
          success: () => context.pushReplacement(Routes.todo),
          error: (error) => showDialog(
            context: context,
            builder: (_) => CustomErrorWidget(message: error),
          ),
          orElse: () {},
        );
      },
      builder: (context, googleState) {
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
            final bool isMainLoading = state is Loading;
            final bool isGoogleLoading = googleState is google.Loading;

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
                  (isMainLoading || isGoogleLoading)
                      ? const Center(child: LoadingWidget())
                      : Column(
                          children: [
                            CustomButton(
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
                            16.ph,
                            CustomButton(
                              onPressed: () {
                                context
                                    .read<GoogleSigninCubit>()
                                    .signInWithGoogle();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.g_mobiledata,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  5.pw,
                                  Text(
                                    'Sign in with Google',
                                    style: AppTextStyles.font15RegularWhite,
                                  ),
                                ],
                              ),
                            ),
                          ],
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
      },
    );
  }
}
