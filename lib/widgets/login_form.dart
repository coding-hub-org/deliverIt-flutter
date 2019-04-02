import 'package:deliverit/blocs/login/login.dart';
import 'package:deliverit/widgets/raised_button_di.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
    @required this.loginBloc,
    @required this.context,
    @required this.margin,
    @required this.usernameController,
    @required this.passwordController,
    @required this.questionStyle,
  }) : super(key: key);

  final LoginBloc loginBloc;
  final BuildContext context;
  final double margin;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextStyle questionStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Text(
                  "Login",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                )),
                Container(
                    margin: EdgeInsets.only(top: margin),
                    child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: "Username",
                        ))),
                Container(
                    margin: EdgeInsets.only(top: margin),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                    )),
                Container(
                  margin: EdgeInsets.only(top: margin),
                  child: RaisedButtonDI(
                    loginBloc: loginBloc,
                    text: "LOGIN",
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: margin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Forgot your password? ",
                        style: questionStyle,
                      ),
                      Text(
                        "Click here",
                        style: questionStyle.copyWith(color: Colors.pinkAccent),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: margin, bottom: margin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Don't have an account yet? ",
                style: questionStyle,
              ),
              GestureDetector(
                onTap: () {
                  print("Register tapped");
                  Navigator.of(context).pushNamed('/signup');
                },
                child: Text(
                  "Register here",
                  style: questionStyle.copyWith(color: Colors.orange),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
