import 'package:firebase_app/features/views/auth/login/view/login_view.dart';
import 'package:firebase_app/features/views/home/profile/view/profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  static String id = '/';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      return const LoginView();
    } else {
      return const ProfileView();
    }
  }
}
