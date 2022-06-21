import 'package:firebase_app/core/base/viewmodel/base_viewmodel.dart';
import 'package:firebase_app/features/views/home/profile/service/profile_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileViewmodel extends BaseViewmodel {
  ProfileViewmodel(super.context);

  User get fetchProfile => ProfileService().fetchProfileInfo;

  Future<dynamic> logOut() async {
    await ProfileService().logOut().then((response) {
      if (response is String) {
        Fluttertoast.showToast(
            msg: FlutterI18n.translate(context, 'common.errors.$response'));
      }
    });
  }
}
