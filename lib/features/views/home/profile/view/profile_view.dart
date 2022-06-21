import 'package:firebase_app/core/base/view/base_view.dart';
import 'package:firebase_app/core/components/translated_text.dart';
import 'package:firebase_app/core/enums/string_case_enum.dart';
import 'package:firebase_app/features/services/auth_service.dart';
import 'package:firebase_app/features/views/home/profile/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);
  static String id = '/profile';
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewmodel>(
      onModelReady: (viewmodel) => viewmodel.initialize(),
      viewmodelBuilder: () => ProfileViewmodel(context),
      builder: ((context, viewmodel, ___) => _buildScaffold(
            context,
            viewmodel,
          )),
    );
  }

  Scaffold _buildScaffold(
    BuildContext context,
    ProfileViewmodel viewmodel,
  ) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildEmail(viewmodel),
                const SizedBox(height: 40),
                _buildUid(viewmodel),
                const SizedBox(height: 40),
                _buildLogOutButton(viewmodel),
                const SizedBox(height: 20),
                _buildVerifyEmailButton(viewmodel),
                _buildEmailVerificationText()
              ],
            ),
          ),
        ],
      ),
    );
  }

  TranslatedText _buildEmail(ProfileViewmodel viewmodel) => TranslatedText(
        'profile.email',
        params: {'email': '${viewmodel.fetchProfile.email}'},
      );

  TranslatedText _buildUid(ProfileViewmodel viewmodel) => TranslatedText(
        'profile.uid',
        params: {'uid': viewmodel.fetchProfile.uid},
      );

  ElevatedButton _buildLogOutButton(ProfileViewmodel viewmodel) {
    return ElevatedButton(
      onPressed: () async => await viewmodel.logOut(),
      child: const TranslatedText(
        'common.buttons.log-out',
        textCase: StringCase.title,
      ),
    );
  }

  Widget _buildVerifyEmailButton(ProfileViewmodel viewmodel) {
    return AuthService().currentUser!.emailVerified
        ? const SizedBox()
        : TextButton(
            child: const TranslatedText(
              'common.buttons.verify-email',
              textCase: StringCase.title,
            ),
            onPressed: () async => await viewmodel.sendVerificationEmail());
  }

  RichText _buildEmailVerificationText() {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: FlutterI18n.translate(context, 'profile.email-verification'),
        style: const TextStyle(color: Colors.grey),
      ),
      TextSpan(
        text: AuthService().currentUser!.emailVerified
            ? FlutterI18n.translate(context, 'profile.verified-email')
            : FlutterI18n.translate(context, 'profile.not-verified-email'),
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]));
  }
}
