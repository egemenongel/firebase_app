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
                _buildEmail(),
                const SizedBox(height: 40),
                _buildUid(),
                const SizedBox(height: 40),
                _buildLogOutButton(_logOut)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _buildEmail() => Text('email: ${AuthService().userInfo!.email!}');

  Text _buildUid() => Text('UID: ${AuthService().userInfo!.uid}');

  ElevatedButton _buildLogOutButton(void Function() logOut) {
    return ElevatedButton(
      onPressed: logOut,
      child: const Text('Log Out'),
    );
  }
}
