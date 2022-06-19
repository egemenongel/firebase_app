import 'dart:developer';

import 'package:firebase_app/config/environment_config.dart';
import 'package:firebase_app/config/firebase_options.dart';
import 'package:firebase_app/features/views/auth/login/view/login_view.dart';
import 'package:firebase_app/features/views/profile.dart';
import 'package:firebase_app/services/auth_service.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: EnvironmentConfig.envPath);
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
      useCountryCode: false,
      fallbackFile: 'en',
      basePath: 'assets/translations',
      decodeStrategies: [
        JsonDecodeStrategy(),
      ],
    ),
    missingTranslationHandler: (key, locale) {
      log("--- Missing Key: $key, languageCode: ${locale!.languageCode}");
    },
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(flutterI18nDelegate));
}

class MyApp extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate;
  const MyApp(this.flutterI18nDelegate, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      initialData: FirebaseAuth.instance.currentUser,
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        supportedLocales: const [
          Locale("en"),
          Locale("tr"),
        ],
        localizationsDelegates: [
          flutterI18nDelegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: FirebaseAuth.instance.currentUser != null
            ? const ProfileView()
            : const LoginView(),
      ),
    );
  }
}
