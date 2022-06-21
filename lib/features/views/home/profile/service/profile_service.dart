import 'dart:developer';

import 'package:firebase_app/features/services/auth_service.dart';

class ProfileService extends AuthService {
  get fetchProfileInfo => super.userInfo;

  Future<dynamic> logOut() async {
    try {
      return await instance.signOut();
    } catch (e) {
      log('$e');
      return 'unknown-exception';
    }
  }
}
