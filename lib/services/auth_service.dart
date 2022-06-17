import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth instance = FirebaseAuth.instance;

  Stream<User?> get user {
    return instance.authStateChanges();
  }

  User? get userInfo {
    return instance.currentUser as User;
  }

  Future register(String email, String password) async {
    try {
      return instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log('$e');
      return null;
    }
  }

  Future logOut() => instance.signOut();
}
