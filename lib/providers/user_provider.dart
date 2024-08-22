import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/models/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, LocalUser>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<LocalUser> {
  UserNotifier() : super(const LocalUser(email: "N/A", id: "N/A"));
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logIn(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    state =
        LocalUser(email: email, id: userCredential.user?.uid ?? "someUserId");
  }

  Future<void> signUp(String email, String password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    state =
        LocalUser(email: email, id: userCredential.user?.uid ?? "someUserId");
  }

  void signOut() {}
}
