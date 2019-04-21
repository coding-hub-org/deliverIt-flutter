import 'package:deliverit/blocs/login/login.dart';
import 'package:deliverit/widgets/page_header.dart';
import 'package:deliverit/widgets/raised_button_di.dart';
import 'package:flutter/material.dart';

typedef void OnLoginCallBack(
    {@required String username, @required String password});

class LoginForm extends StatelessWidget {
  const LoginForm(
      {Key key,
      // @required this.context,
      @required this.margin,
      @required this.usernameController,
      @required this.passwordController,
      @required this.questionStyle,
      this.onLoginTapped})
      : super(key: key);

  // final BuildContext context;
  final double margin;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextStyle questionStyle;
  final OnLoginCallBack onLoginTapped;

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
                PageHeader(
                  header: "Login",
                ),
                _buildUsernameField(),
                _buildPasswordField(),
                Container(
                  margin: EdgeInsets.only(top: margin),
                  child: RaisedButtonDI(
                    onPressed: () => {
                          onLoginTapped(
                              username: usernameController.text,
                              password: passwordController.text)
                        },
                    text: "LOGIN",
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
                // _buildForgotPasswordLine()
              ],
            ),
          ),
        ),
        _buildRegisterLine(context)
      ],
    );
  }

  Container _buildRegisterLine(BuildContext context) {
    return Container(
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
    );
  }

  Container _buildForgotPasswordLine() {
    return Container(
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
    );
  }

  Container _buildPasswordField() {
    return Container(
        margin: EdgeInsets.only(top: margin),
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: "Password"),
        ));
  }

  Container _buildUsernameField() {
    return Container(
        margin: EdgeInsets.only(top: margin),
        child: TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: "Username",
            )));
  }
}
