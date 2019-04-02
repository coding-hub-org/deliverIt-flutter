import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  MyButton({String name}) : this.name = name;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: RaisedButton(
          child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: new Text(
                name,
                style: new TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w100,
                ),
              )),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0)),
          textColor: Colors.white,
          onPressed: () {
            debugPrint("TEST");
          },
        ));
  }
}
