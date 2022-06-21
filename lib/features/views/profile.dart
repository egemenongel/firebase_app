import 'package:firebase_app/features/services/auth_service.dart';
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
                _buildLogOutButton()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _buildEmail() => Text('email: ${AuthService().userInfo!.email!}');

  Text _buildUid() => Text('UID: ${AuthService().userInfo!.uid}');

  ElevatedButton _buildLogOutButton() {
    return ElevatedButton(
      onPressed: () async => await AuthService().logOut(),
      child: const Text('Log Out'),
    );
  }
}
