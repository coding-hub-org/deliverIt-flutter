import 'package:flutter/material.dart';

class StyledInputField extends StatelessWidget {
  final name;
  StyledInputField(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        child: TextFormField(
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Color(0xFF9A9A9A)),
              fillColor: Colors.black,
              hintText: name,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                  borderRadius: BorderRadius.all(Radius.circular(0))),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)))),
        ),
      ),
    );
  }
}
