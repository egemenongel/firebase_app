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
    void _login() async {
      var response = await AuthService().login(email.text, password.text);
      if (response != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfileView()));
      } else {
        log('$response');
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildTitle(),
          _buildEmailField(),
          _buildPasswordField(),
          const SizedBox(height: 50),
          _buildLoginButton(_login),
          _buildRegisterButton(context)
        ]),
      ),
    );
  }

  Text _buildTitle() => const Text('LOGIN');
  TextField _buildEmailField() => TextField(controller: email);
  TextField _buildPasswordField() => TextField(controller: password);
  ElevatedButton _buildLoginButton(void Function() login) {
    return ElevatedButton(
      onPressed: login,
      child: const Text('Login'),
    );
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
