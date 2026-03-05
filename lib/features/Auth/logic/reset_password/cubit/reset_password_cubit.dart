import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.dart';
part 'reset_password_cubit.freezed.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordState.initial());
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> resetPassword() async {
    emit(ResetPasswordState.loading());
    try {
      await firebaseAuth.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      emit(ResetPasswordState.success());
    } on FirebaseAuthException catch (e) {
      emit(ResetPasswordState.error(e.message.toString()));
    } catch (e) {
      emit(ResetPasswordState.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
