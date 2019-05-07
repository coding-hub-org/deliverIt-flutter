import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 30.0,
      width: 1.0,
      color: Color(0xFFE2E2E2),
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}
