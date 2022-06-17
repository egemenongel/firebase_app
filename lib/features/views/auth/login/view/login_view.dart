import 'package:firebase_app/core/base/view/base_view.dart';
import 'package:firebase_app/core/components/translated_text.dart';
import 'package:firebase_app/core/enums/string_case_enum.dart';
import 'package:firebase_app/features/views/auth/login/viewmodel/login_viewmodel.dart';
import 'package:firebase_app/features/views/register.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      onModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => LoginViewModel(context),
      builder: ((context, viewModel, ___) => _buildScaffold(
            context,
            viewModel,
          )),
    );
  }

  Scaffold _buildScaffold(
    BuildContext context,
    LoginViewModel viewModel,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildTitle(),
          _buildEmailField(viewModel),
          _buildPasswordField(viewModel),
          const SizedBox(height: 50),
          _buildLoginButton(viewModel),
          _buildRegisterButton(context)
        ]),
      ),
    );
  }

  TranslatedText _buildTitle() => const TranslatedText(
        'login.title',
        textCase: StringCase.title,
      );
  TextField _buildEmailField(LoginViewModel viewModel) =>
      TextField(controller: viewModel.emailController);
  TextField _buildPasswordField(LoginViewModel viewModel) =>
      TextField(controller: viewModel.passwordController);
  ElevatedButton _buildLoginButton(LoginViewModel viewModel) {
    return ElevatedButton(
      onPressed: () => viewModel.login(),
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
            MaterialPageRoute(builder: (context) => RegisterView()),
          );
        },
        child: const TranslatedText('login.register'));
  }
}
