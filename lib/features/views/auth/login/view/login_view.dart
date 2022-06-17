import 'package:firebase_app/core/base/view/base_view.dart';
import 'package:firebase_app/core/components/translated_text.dart';
import 'package:firebase_app/core/enums/string_case_enum.dart';
import 'package:firebase_app/features/views/auth/login/viewmodel/login_viewmodel.dart';
import 'package:firebase_app/features/views/auth/register/view/register_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewmodel>(
      onModelReady: (viewmodel) => viewmodel.initialize(),
      viewmodelBuilder: () => LoginViewmodel(context),
      builder: ((context, viewmodel, ___) => _buildScaffold(
            context,
            viewmodel,
          )),
    );
  }

  Scaffold _buildScaffold(
    BuildContext context,
    LoginViewmodel viewmodel,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildTitle(),
          _buildEmailField(viewmodel),
          _buildPasswordField(viewmodel),
          const SizedBox(height: 50),
          _buildLoginButton(viewmodel),
          _buildRegisterButton(context)
        ]),
      ),
    );
  }

  TranslatedText _buildTitle() => const TranslatedText(
        'login.title',
        textCase: StringCase.title,
      );
  TextField _buildEmailField(LoginViewmodel viewmodel) =>
      TextField(controller: viewmodel.emailController);
  TextField _buildPasswordField(LoginViewmodel viewmodel) =>
      TextField(controller: viewmodel.passwordController);
  ElevatedButton _buildLoginButton(LoginViewmodel viewmodel) {
    return ElevatedButton(
      onPressed: () => viewmodel.login(),
      child: const TranslatedText(
        'common.buttons.login',
        textCase: StringCase.title,
      ),
    );
  }

  TextButton _buildRegisterButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterView()),
          );
        },
        child: const TranslatedText('login.register'));
  }
}
