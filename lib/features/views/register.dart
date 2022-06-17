import 'package:firebase_app/core/base/view/base_view.dart';
import 'package:firebase_app/features/views/auth/register/viewmodel/register_viewmodel.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewmodel>(
      onModelReady: (viewmodel) => viewmodel.initialize(),
      viewmodelBuilder: () => RegisterViewmodel(context),
      builder: ((context, viewmodel, ___) => _buildScaffold(
            context,
            viewmodel,
          )),
    );
  }

  Scaffold _buildScaffold(
    BuildContext context,
    RegisterViewmodel viewmodel,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildTitle(),
          _buildEmailField(viewmodel),
          _buildPasswordField(viewmodel),
          const SizedBox(height: 50),
          _buildRegisterButton(viewmodel),
          _buildLoginButton(context)
        ]),
      ),
    );
  }

  Text _buildTitle() => const Text('REGISTER');
  TextField _buildEmailField(RegisterViewmodel viewmodel) =>
      TextField(controller: viewmodel.emailController);
  TextField _buildPasswordField(RegisterViewmodel viewmodel) =>
      TextField(controller: viewmodel.passwordController);
  ElevatedButton _buildRegisterButton(RegisterViewmodel viewmodel) {
    return ElevatedButton(
      onPressed: () => viewmodel.register(),
      child: const Text('Register'),
    );
  }

  TextButton _buildLoginButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: const Text('OR LOGIN'),
    );
  }
}
