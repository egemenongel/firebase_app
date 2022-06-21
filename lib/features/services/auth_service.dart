import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth instance = FirebaseAuth.instance;

  User? get currentUser => instance.currentUser;

  Stream<User?> get user {
    return instance.authStateChanges();
  }

  User? get userInfo {
    return instance.currentUser;
  }
}
