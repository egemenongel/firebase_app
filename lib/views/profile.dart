import 'package:firebase_app/services/auth_service.dart';
import 'package:firebase_app/views/login.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    void _logOut() {
      AuthService().logOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginView()),
          (route) => false);
    }

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('email: ${AuthService().userInfo!.email!}'),
                const SizedBox(height: 40),
                Text('UID: ${AuthService().userInfo!.uid}'),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _logOut,
                  child: const Text('Log Out'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
