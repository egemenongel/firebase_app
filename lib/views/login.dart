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
          const Text('LOGIN'),
          TextField(controller: email),
          TextField(controller: password),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () async {
              var response =
                  await AuthService().login(email.text, password.text);
              if (response != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileView()));
              } else {
                log('$response');
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterView()));
              },
              child: const Text('OR REGISTER'))
        ]),
      ),
    );
  }
}
