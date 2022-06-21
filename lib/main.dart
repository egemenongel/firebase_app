import 'dart:developer';

import 'package:firebase_app/config/environment_config.dart';
import 'package:firebase_app/config/firebase_options.dart';
import 'package:firebase_app/features/services/auth_service.dart';
import 'package:firebase_app/features/wrapper.dart';

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
          primarySwatch: Colors.blue,
        ),
        home: const Wrapper(),
      ),
    );
  }
}
