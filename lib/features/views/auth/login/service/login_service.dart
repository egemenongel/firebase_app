import 'package:firebase_app/features/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService extends AuthService {
  Future<dynamic> login(Map<String, dynamic> payload) async {
    try {
      return await super.instance.signInWithEmailAndPassword(
            email: payload['email'],
            password: payload['password'],
          );
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return '$e';
    }
  }
}
