import 'package:firebase_app/core/base/view/base_view.dart';
import 'package:firebase_app/core/components/buttons/custom_elevated_button.dart';
import 'package:firebase_app/core/components/custom_text_field.dart';
import 'package:firebase_app/core/components/translated_text.dart';
import 'package:firebase_app/core/enums/string_case_enum.dart';
import 'package:firebase_app/core/extensions/context_extension.dart';
import 'package:firebase_app/features/views/auth/reset_password/viewmodel/reset_password_viewmodel.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);
  static String id = '/resetPassword';
  @override
  @override
  Widget build(BuildContext context) {
    return BaseView<ResetPasswordViewmodel>(
      builder: builder,
      viewmodelBuilder: () => ResetPasswordViewmodel(context),
      onModelReady: (viewModel) => viewModel.initialize(),
    );
  }

  Widget builder(
    BuildContext context,
    ResetPasswordViewmodel viewmodel,
    Widget? child,
  ) {
    return Scaffold(
      body: Padding(
        padding: context.paddingLowHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(),
            const SizedBox(
              height: 20,
            ),
            _buildEmailField(viewmodel),
            const SizedBox(
              height: 40,
            ),
            _buildResetPasswordButton(viewmodel)
          ],
        ),
      ),
    );
  }

  TranslatedText _buildTitle() {
    return const TranslatedText(
      'reset_password.title',
      textCase: StringCase.title,
    );
  }

  CustomTextField _buildEmailField(ResetPasswordViewmodel viewmodel) {
    return CustomTextField(
      controller: viewmodel.emailController,
      labelText: 'common.fields.email.label',
      hintText: 'common.fields.email.hint',
    );
  }

  CustomElevatedButton _buildResetPasswordButton(
      ResetPasswordViewmodel viewmodel) {
    return CustomElevatedButton(
      onPressed: viewmodel.resetPassword,
      text: 'common.buttons.forgot-password',
    );
  }
}
