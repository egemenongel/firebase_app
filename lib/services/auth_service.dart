import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _instance = FirebaseAuth.instance;

  Stream<User?> get user {
    return _instance.authStateChanges();
  }

  User? get userInfo {
    return _instance.currentUser as User;
  }

  Future login(String email, String password) async {
    try {
      return _instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log('$e');
      return null;
    }
  }

  Future register(String email, String password) async {
    try {
      return _instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log('$e');
      return null;
    }
  }

  Future logOut() => _instance.signOut();
}
