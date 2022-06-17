import 'dart:developer';

import 'package:firebase_app/core/base/viewmodel/base_viewmodel.dart';
import 'package:firebase_app/features/views/auth/login/service/login_service.dart';
import 'package:firebase_app/features/views/profile.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel(super.context);
  Map<String, dynamic> payload = {};
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    payload.addAll({
      "email": emailController.text,
      "password": passwordController.text,
    });
    await LoginService().login(payload).then((response) {
      if (response != null) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (navigator) => const ProfileView()));
      } else {
        log('$response');
      }
    });
  }
}
