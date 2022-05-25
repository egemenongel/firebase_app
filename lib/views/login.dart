import 'package:firebase_app/views/profile.dart';
import 'package:firebase_app/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              var response = await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: email.text, password: password.text);
              if (response.user != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileView()));
              } else {
                print('false');
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
