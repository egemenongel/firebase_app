import 'package:firebase_app/features/views/auth/login/view/login_view.dart';
import 'package:firebase_app/features/views/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

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
