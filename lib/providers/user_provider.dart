import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/models/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, LocalUser>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<LocalUser> {
  UserNotifier() : super(const LocalUser(email: "error"));
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);

    state = LocalUser(email: email);
  }

  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    state = LocalUser(email: email);
  }

  void signOut() {}
}
