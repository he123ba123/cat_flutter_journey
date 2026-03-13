import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cat_flutter_journey/features/todos/data/models/todo_model.dart';

import 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(const TodosState.initial()) {
    getTodos();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void getTodos() {
    final userId = _auth.currentUser?.uid;
    if (userId == null) {
      emit(const TodosState.error('User not logged in'));
      return;
    }

    emit(const TodosState.loading());

    _firestore
        .collection('users')
        .doc(userId)
        .collection('todos')
        .snapshots()
        .listen(
          (snapshot) {
            final todos = snapshot.docs.map((doc) {
              final data = doc.data();
              return TodoModel.fromJson(data);
            }).toList();
            emit(TodosState.success(todos));
          },
          onError: (error) {
            emit(TodosState.error(error.toString()));
          },
        );
  }

  Future<void> addTodo({
    required String title,
    required String subtitle,
  }) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    final docRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('todos')
        .doc();

    final newTodo = TodoModel(id: docRef.id, title: title, subtitle: subtitle);

    try {
      await docRef.set(newTodo.toJson());
    } catch (e) {
      emit(TodosState.error(e.toString()));
    }
  }

  Future<void> updateTodo(String id, {String? title, String? subtitle}) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    final updates = <String, dynamic>{};
    if (title != null) updates['title'] = title;
    if (subtitle != null) updates['subtitle'] = subtitle;

    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('todos')
          .doc(id)
          .update(updates);
    } catch (e) {
      emit(TodosState.error(e.toString()));
    }
  }

  Future<void> deleteTodo(String id) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('todos')
          .doc(id)
          .delete();
    } catch (e) {
      emit(TodosState.error(e.toString()));
    }
  }

  Future<void> toggleTodoCompletion(String id, bool currentStatus) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('todos')
          .doc(id)
          .update({'isCompleted': !currentStatus});
    } catch (e) {
      emit(TodosState.error(e.toString()));
    }
  }
}
