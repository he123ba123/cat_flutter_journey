import 'package:bloc/bloc.dart';
import 'package:cat_flutter_journey/features/Auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getUserData() async {
    emit(HomeState.loading());
    try {
      final user = _auth.currentUser;
      if (user == null) {
        emit(
          HomeState.error('No authenticated user found. Please sign in again.'),
        );
        return;
      }

      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final data = userDoc.data();

      if (data == null) {
        emit(HomeState.error('User data not found in database.'));
        return;
      }

      final userData = UserModel.fromJson(data);
      emit(HomeState.success(userData));
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }
}
