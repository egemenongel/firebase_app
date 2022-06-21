import 'package:firebase_app/core/components/translated_text.dart';
import 'package:firebase_app/core/enums/string_case_enum.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    this.onPressed,
    this.text,
    this.stringCase,
    this.color,
  }) : super(key: key);
  final void Function()? onPressed;
  final String? text;
  final StringCase? stringCase;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: TranslatedText(
        text ?? '',
        textCase: stringCase ?? StringCase.title,
      ),
    );
  }
}
