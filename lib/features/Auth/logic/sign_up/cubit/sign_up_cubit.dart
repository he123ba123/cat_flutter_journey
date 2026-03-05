import 'package:bloc/bloc.dart';
import 'package:cat_flutter_journey/core/helpers/shared_pref_helper.dart';
import 'package:cat_flutter_journey/core/utils/secure_storage_keys.dart';
import 'package:cat_flutter_journey/features/Auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState.initial());

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController uid = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    uid.dispose();
    return super.close();
  }

  Future<void> signUpWithEmailAndPassword() async {
    emit(SignUpState.loading());
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
      if (userCredential.user == null) {
        emit(SignUpState.error('User not found'));
        return;
      }
      final String uid = userCredential.user!.uid;
      final UserModel userModel = UserModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        phone: phoneController.text.trim(),
        uId: uid,
      );
      await firebaseFirestore
          .collection('users')
          .doc(uid)
          .set(userModel.toJson());
      emit(SignUpState.success());
    } on FirebaseAuthException catch (e) {
      emit(SignUpState.error(e.code));
    } catch (e) {
      emit(SignUpState.error(e.toString()));
    }
  }
}
