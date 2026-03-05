import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/Auth/logic/sign_up/cubit/sign_up_cubit.dart';

class TextFormFieldsAndButtonSignUp extends StatelessWidget {
  const TextFormFieldsAndButtonSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is Success) {
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
          key: context.read<SignUpCubit>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextFormField(
                controller: context.read<SignUpCubit>().firstNameController,
                hintText: 'First Name',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              12.ph,
              CustomTextFormField(
                controller: context.read<SignUpCubit>().lastNameController,
                hintText: 'Last Name',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              12.ph,
              CustomTextFormField(
                controller: context.read<SignUpCubit>().emailController,
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
                controller: context.read<SignUpCubit>().phoneController,
                hintText: 'Phone Number',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              12.ph,
              CustomTextFormField(
                controller: context.read<SignUpCubit>().passwordController,
                hintText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),

              30.ph,
              state is Loading
                  ? const LoadingWidget()
                  : CustomButton(
                      onPressed: () {
                        if (context
                            .read<SignUpCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          context
                              .read<SignUpCubit>()
                              .signUpWithEmailAndPassword();
                        }
                      },
                      title: 'Sign Up',
                    ),
              20.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: AppTextStyles.font15Regular,
                    textAlign: TextAlign.center,
                  ),
                  5.pw,
                  InkWell(
                    onTap: () {
                      context.push(Routes.signin);
                    },
                    child: Text(
                      "Sign In",
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
