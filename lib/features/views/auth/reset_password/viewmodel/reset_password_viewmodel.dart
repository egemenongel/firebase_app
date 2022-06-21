import 'package:firebase_app/core/base/viewmodel/base_viewmodel.dart';
import 'package:firebase_app/features/views/auth/reset_password/service/reset_password_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPasswordViewmodel extends BaseViewmodel {
  ResetPasswordViewmodel(super.context);

  TextEditingController emailController = TextEditingController();

  Future resetPassword() async {
    await ResetPasswordService()
        .resetPassword(emailController.text)
        .then((response) {
      if (response is String) {
        Fluttertoast.showToast(
            msg: FlutterI18n.translate(context, 'common.errors.$response'));
      } else {
        Fluttertoast.showToast(
            msg: FlutterI18n.translate(
                context, 'common.messages.reset-password-email'));
      }
    });
  }
}
