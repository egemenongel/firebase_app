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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('LOGGED IN'),
          ElevatedButton(
            onPressed: () {
              AuthService().logOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                  (route) => false);
            },
            child: const Text('Log Out'),
          )
        ],
      ),
    );
  }
}
