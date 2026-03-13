import 'package:bloc/bloc.dart';
import 'package:cat_flutter_journey/core/helpers/shared_pref_helper.dart';
import 'package:cat_flutter_journey/core/utils/secure_storage_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cat_flutter_journey/features/Auth/logic/google_sign_in/cubit/google_signin_state.dart';

class GoogleSigninCubit extends Cubit<GoogleSigninState> {
  GoogleSigninCubit() : super(const GoogleSigninState.initial());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInWithGoogle() async {
    emit(const GoogleSigninState.loading());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        emit(const GoogleSigninState.initial());
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        final userDoc = await _firestore
            .collection('users')
            .doc(user.uid)
            .get();
        if (!userDoc.exists) {
          final String displayName = user.displayName ?? "";
          final List<String> nameParts = displayName.split(" ");
          final String firstName = nameParts.isNotEmpty ? nameParts[0] : "";
          final String lastName = nameParts.length > 1
              ? nameParts.sublist(1).join(" ")
              : "";

          await _firestore.collection('users').doc(user.uid).set({
            'uId': user.uid,
            'email': user.email ?? "",
            'firstName': firstName,
            'lastName': lastName,
            'phone': user.phoneNumber ?? "",
            'password': '',
          });
        }

        await SharedPrefHelper.setData(
          key: SecureStorageKeys.email,
          value: user.email,
        );

        emit(const GoogleSigninState.success());
      } else {
        emit(const GoogleSigninState.error('Failed to sign in with Google'));
      }
    } on FirebaseAuthException catch (e) {
      emit(GoogleSigninState.error(e.code));
    } catch (e) {
      emit(GoogleSigninState.error(e.toString()));
    }
  }
}
