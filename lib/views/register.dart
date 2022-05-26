import 'dart:developer';

import 'package:firebase_app/services/auth_service.dart';
import 'package:firebase_app/views/profile.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void _register() async {
      var response = await AuthService().register(email.text, password.text);
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
          _buildRegisterButton(_register),
          _buildLoginButton(context)
        ]),
      ),
    );
  }

  Text _buildTitle() => const Text('REGISTER');
  TextField _buildEmailField() => TextField(controller: email);
  TextField _buildPasswordField() => TextField(controller: password);
  ElevatedButton _buildRegisterButton(void Function() register) {
    return ElevatedButton(
      onPressed: register,
      child: const Text('Register'),
    );
  }

  TextButton _buildLoginButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: const Text('OR LOGIN'),
    );
  }
}
