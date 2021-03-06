import 'package:firebase_app/core/base/viewmodel/base_viewmodel.dart';
import 'package:firebase_app/features/views/auth/register/service/register_service.dart';
import 'package:firebase_app/features/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterViewmodel extends BaseViewmodel {
  RegisterViewmodel(super.context);

  final Map<String, dynamic> _payload = {};
  get payload => _payload;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future register() async {
    payload.addAll({
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
    });

    await RegisterService().register(payload).then((response) {
      if (response is String) {
        Fluttertoast.showToast(
            msg: FlutterI18n.translate(context, 'common.errors.$response'));
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, SplashView.id, (route) => false);
      }
    });
  }
}
