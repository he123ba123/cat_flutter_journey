import 'package:bloc/bloc.dart';
import 'package:cat_flutter_journey/core/helpers/secure_storage_helper.dart';
import 'package:cat_flutter_journey/core/helpers/shared_pref_helper.dart';
import 'package:cat_flutter_journey/core/utils/secure_storage_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState.initial());

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  Future<void> signInWithEmailAndPassword() async {
    emit(SignInState.loading());
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      emit(SignInState.success());
      await SharedPrefHelper.setData(
        key: SecureStorageKeys.token,
        value: firebaseAuth.currentUser!.email,
      );
    } on FirebaseAuthException catch (e) {
      emit(SignInState.error(e.code));
    } catch (e) {
      emit(SignInState.error(e.toString()));
    }
  }
}
