import 'package:firebase_app/core/base/viewmodel/base_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class ResetPasswordViewmodel extends BaseViewmodel {
  ResetPasswordViewmodel(super.context);

  TextEditingController emailController = TextEditingController();

  void resetPassword() async {}
}
