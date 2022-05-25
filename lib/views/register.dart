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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('REGISTER'),
          TextField(controller: email),
          TextField(controller: password),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () async {
              var response =
                  await AuthService().register(email.text, password.text);
              if (response != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileView()));
              } else {
                log('$response');
              }
            },
            child: const Text('Register'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OR LOGIN'),
          )
        ]),
      ),
    );
  }
}
