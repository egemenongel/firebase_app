import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentConfig {
  static String get fileName =>
      kReleaseMode ? ".env.production" : ".env.development";
  static String get apiUrl => dotenv.env['API_URL'] ?? 'MY_FALLBACK';

  static String get firebaseWebApiKey =>
      dotenv.env['WEB_FIREBASE_API_KEY'] ?? 'MY_FALLBACK';
  static String get firebaseAndroidApiKey =>
      dotenv.env['ANDROID_FIREBASE_API_KEY'] ?? 'MY_FALLBACK';
  static String get firebaseIosApiKey =>
      dotenv.env['IOS_FIREBASE_API_KEY'] ?? 'MY_FALLBACK';
  static String get firebaseMacOsApiKey =>
      dotenv.env['MACOS_FIREBASE_API_KEY'] ?? 'MY_FALLBACK';
}
