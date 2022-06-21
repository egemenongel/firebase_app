import 'dart:developer';

import 'package:firebase_app/features/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordService extends AuthService {
  Future<dynamic> resetPassword(String email) async {
    try {
      return await super.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      log('$e');
      return e.code;
    } catch (e) {
      log('$e');
      return 'unknown-exception';
    }
  }
}
