import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final FirebaseAuth _instance = FirebaseAuth.instance;
  Future<UserCredential?> login(Map<String, dynamic> payload) async =>
      _instance.signInWithEmailAndPassword(
        email: payload['email'],
        password: payload['password'],
      );
}
