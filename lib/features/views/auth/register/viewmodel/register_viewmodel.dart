import 'package:firebase_app/core/base/viewmodel/base_viewmodel.dart';
import 'package:firebase_app/features/views/auth/register/service/register_service.dart';
import 'package:firebase_app/features/views/home/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterViewmodel extends BaseViewmodel {
  RegisterViewmodel(super.context);
  Map<String, dynamic> payload = {};
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future register() async {
    payload.addAll({
      "email": emailController.text,
      "password": passwordController.text,
    });

    await RegisterService().register(payload).then((response) {
      if (response is String) {
        Fluttertoast.showToast(
            msg: FlutterI18n.translate(context, 'common.errors.$response'));
      } else {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (navigator) => const ProfileView()));
      }
    });
  }
}
