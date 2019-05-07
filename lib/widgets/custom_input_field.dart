import 'package:flutter/material.dart';

typedef void ValidatorCallback(String text);

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key key,
    this.focusNode,
    this.nextFocusNode,
    this.controller,
    this.labelText,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextEditingController controller;
  final String labelText;
  final ValidatorCallback validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        focusNode: focusNode,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        onFieldSubmitted: (text) {
          focusNode.unfocus();
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
