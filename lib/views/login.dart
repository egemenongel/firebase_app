import 'dart:developer';

import 'package:firebase_app/services/auth_service.dart';
import 'package:firebase_app/views/profile.dart';
import 'package:firebase_app/views/register.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildTitle(),
          _buildEmailField(),
          _buildPasswordField(),
          const SizedBox(height: 50),
          _buildLoginButton(context),
          _buildRegisterButton(context)
        ]),
      ),
    );
  }

  Text _buildTitle() => const Text('LOGIN');
  TextField _buildEmailField() => TextField(controller: email);
  TextField _buildPasswordField() => TextField(controller: password);
  ElevatedButton _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _login(context),
      child: const Text('Login'),
    );
  }

  void _login(BuildContext context) async {
    var response = await AuthService().login(email.text, password.text);
    final navigator = Navigator.of(context);
    if (response != null) {
      navigator
          .push(MaterialPageRoute(builder: (navigator) => const ProfileView()));
    } else {
      log('$response');
    }
  }

  TextButton _buildRegisterButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterView()));
        },
        child: const Text('OR REGISTER'));
  }
}
