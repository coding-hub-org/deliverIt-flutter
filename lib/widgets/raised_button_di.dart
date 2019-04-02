import 'package:deliverit/blocs/login/login.dart';
import 'package:flutter/material.dart';

class RaisedButtonDI extends StatelessWidget {
  const RaisedButtonDI(
      {Key key,
      @required this.text,
      @required this.loginBloc,
      this.width = 300})
      : assert(text != null),
        assert(loginBloc != null),
        super(key: key);

  final LoginBloc loginBloc;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          elevation: 1,
          highlightElevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            loginBloc.dispatch(
                LoginButtonPressed(username: "dsadas", password: "dasdasd"));
          },
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ));
  }
}
