import 'package:firebase_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.validationKey,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.textInputAction,
    this.errorTextVisible = true,
    this.isFilled = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final String? validationKey;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool errorTextVisible;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText:
            hintText != null ? FlutterI18n.translate(context, hintText!) : "",
        filled: isFilled,
        labelText:
            hintText != null ? FlutterI18n.translate(context, labelText!) : "",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(context.lowestRadius),
          borderSide: BorderSide(color: context.colors.primary),
        ),
        contentPadding: context.paddingNormalHorizontal,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
      validator: (val) => controller.text.isEmpty
          ? FlutterI18n.translate(context, "common.errors.empty")
          : null,
      textInputAction: textInputAction ?? TextInputAction.next,
      onTap: onTap,
    );
  }
}
