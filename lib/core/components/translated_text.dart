import 'package:firebase_app/core/enums/string_case_enum.dart';
import 'package:firebase_app/core/extensions/string_case_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class TranslatedText extends StatefulWidget {
  const TranslatedText(this.text,
      {Key? key,
      this.params,
      this.textCase,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textStyle,
      this.textAlign,
      this.textDecoration})
      : super(key: key);
  final String text;
  final StringCase? textCase;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Map<String, String>? params;
  final TextDecoration? textDecoration;
  @override
  State<TranslatedText> createState() => _TranslatedTextState();
}

class _TranslatedTextState extends State<TranslatedText> {
  String text(String? text) {
    var translated = FlutterI18n.translate(context, widget.text,
        translationParams: widget.params);
    switch (widget.textCase) {
      case StringCase.cap:
        translated = translated.toCapitalized();
        break;
      case StringCase.title:
        translated = translated.toTitleCase();
        break;
      case StringCase.upper:
        translated = translated.toUpperCase();
        break;
      case StringCase.lower:
        translated = translated.toLowerCase();
        break;
      default:
    }
    return translated;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text(widget.text),
      textAlign: widget.textAlign,
      overflow: TextOverflow.fade,
      style: widget.textStyle ??
          TextStyle(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: widget.color,
              decoration: widget.textDecoration),
    );
  }
}
