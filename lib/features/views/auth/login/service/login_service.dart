import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final FirebaseAuth _instance = FirebaseAuth.instance;
  Future<dynamic> login(Map<String, dynamic> payload) async {
    try {
      return await _instance.signInWithEmailAndPassword(
        email: payload['email'],
        password: payload['password'],
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {
      } else if (e.code == 'invalid-email') {
      } else if (e.code == 'unknown') {}
      return e.code;
    } catch (e) {
      return '$e';
    }
  }
}
