import 'package:firebase_app/core/extensions/context_extension.dart';
import 'package:firebase_app/core/extensions/string_case_extension.dart';
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
    this.isBordered = false,
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
  final bool isBordered;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText:
            hintText != null ? FlutterI18n.translate(context, hintText!) : "",
        filled: isFilled,
        labelText: labelText != null
            ? FlutterI18n.translate(context, labelText!).toTitleCase()
            : "",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: isBordered
            ? OutlineInputBorder(
                borderRadius: BorderRadius.all(context.lowestRadius),
                borderSide: BorderSide(color: context.colors.primary),
              )
            : null,
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
