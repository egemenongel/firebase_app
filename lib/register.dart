import 'package:firebase_auth/firebase_auth.dart';
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
            onPressed: () {
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email.text,
                password: password.text,
              );
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
