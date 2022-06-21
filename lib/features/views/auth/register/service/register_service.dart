import 'dart:developer';

import 'package:firebase_app/features/services/auth_service.dart';
import 'package:firebase_app/features/views/auth/login/service/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterService extends AuthService {
  Future<dynamic> register(Map<String, dynamic> payload) async {
    try {
      return await super
          .instance
          .createUserWithEmailAndPassword(
            email: payload['email'],
            password: payload['password'],
          )
          .then((value) => LoginService().login(payload));
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      log('$e');
      return 'unknown-exception';
    }
  }
}
