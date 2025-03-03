import 'package:flutter/material.dart';
import 'package:flutter_application/utils/textfield_style.dart';

class LoginTextFormFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validate;
  final bool obscureText;

  const LoginTextFormFields({
    super.key,
    required this.controller,
    required this.hintText,
    this.validate,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (validate != null) {
          return validate!(value);
        }
        return null;
      },
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: TextThemeStyle.loginTextStyle,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
