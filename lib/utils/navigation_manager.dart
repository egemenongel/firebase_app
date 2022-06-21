import 'package:firebase_app/features/views/auth/login/view/login_view.dart';
import 'package:firebase_app/features/views/auth/register/view/register_view.dart';
import 'package:firebase_app/features/views/home/profile/view/profile_view.dart';
import 'package:firebase_app/features/splash_view.dart';
import 'package:flutter/cupertino.dart';

class NavigationManager {
  static NavigationManager? _instance;

  static NavigationManager? get instance {
    _instance ??= NavigationManager._init();
    return _instance;
  }

  NavigationManager._init();

  var routes = <String, Widget Function(BuildContext)>{
    SplashView.id: (context) => const SplashView(),
    LoginView.id: (context) => const LoginView(),
    RegisterView.id: (context) => const RegisterView(),
    ProfileView.id: (context) => const ProfileView(),
  };
}
