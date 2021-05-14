import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:teammate/core/extensions/locale_extensions.dart';
import 'package:teammate/core/lang/locale_key.g.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key,
    this.iconData,
    this.hintText,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final IconData? iconData;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: TextFormField(
        controller: controller,
        decoration: buildTextFieldDecoration(
          context,
          hintText,
          iconData,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.sign_up_validation.locale;
          }
          return null;
        },
      ),
    );
  }

  InputDecoration buildTextFieldDecoration(
      BuildContext context, String? hintText, IconData? iconData) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: context.normalBorderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: context.normalBorderRadius,
        borderSide: BorderSide(
          color: context.colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: context.normalBorderRadius,
        borderSide: BorderSide(
          color: context.colorScheme.secondary,
        ),
      ),
      hintText: hintText,
      icon: iconData == null
          ? SizedBox.shrink()
          : FaIcon(
              iconData,
              color: context.colorScheme.secondary,
            ),
      suffixText: hintText,
    );
  }
}
