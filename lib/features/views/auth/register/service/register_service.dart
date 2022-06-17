import 'package:firebase_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterService extends AuthService {
  Future<dynamic> register(Map<String, dynamic> payload) async {
    try {
      return await super.instance.createUserWithEmailAndPassword(
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
