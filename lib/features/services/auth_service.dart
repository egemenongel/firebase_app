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

  Future<dynamic> logOut() async {
    try {
      return await instance.signOut();
    } catch (e) {
      log('$e');
      return 'unknown-exception';
    }
  }
}
