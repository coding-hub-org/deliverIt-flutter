import 'package:deliverit/blocs/login/login.dart';
import 'package:deliverit/widgets/page_header.dart';
import 'package:deliverit/widgets/raised_button_di.dart';
import 'package:flutter/material.dart';

typedef void OnLoginCallBack({
  @required String username,
  @required String password,
});

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
    @required this.margin,
    @required this.emailController,
    @required this.passwordController,
    @required this.questionStyle,
    this.onLoginTapped,
    @required this.formKey,
  }) : super(key: key);

  final double margin;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextStyle questionStyle;
  final OnLoginCallBack onLoginTapped;
  final GlobalKey<FormState> formKey;

  @override
<<<<<<< HEAD
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
                    onClick: () {
                      loginBloc.dispatch(LoginButtonPressed(
                          username: "dsadas", password: "dasdasd"));
                    },
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
=======
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  @override
  void dispose() {
    emailNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  Container _buildRegisterLine(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.margin, bottom: widget.margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account yet? ",
            style: widget.questionStyle,
          ),
          GestureDetector(
            onTap: () {
              print("Register tapped");
              Navigator.of(context).pushNamed('/signup');
            },
            child: Text(
              "Register here",
              style: widget.questionStyle.copyWith(color: Colors.orange),
>>>>>>> c91a50807454f013bde6b79b7bc7aef0d78483a3
            ),
          ),
        ],
      ),
    );
  }

  Container _buildForgotPasswordLine() {
    return Container(
      margin: EdgeInsets.only(top: widget.margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot your password? ",
            style: widget.questionStyle,
          ),
          Text(
            "Click here",
            style: widget.questionStyle.copyWith(color: Colors.pinkAccent),
          )
        ],
      ),
    );
  }

  Container _buildPasswordField() {
    return Container(
      margin: EdgeInsets.only(top: widget.margin),
      child: TextFormField(
        focusNode: passwordNode,
        validator: (text) =>
            text.isNotEmpty ? null : "Password cannot be blank",
        controller: widget.passwordController,
        obscureText: true,
        decoration: InputDecoration(labelText: "Password"),
      ),
    );
  }

  Container _buildEmailField() {
    return Container(
      margin: EdgeInsets.only(top: widget.margin),
      child: TextFormField(
        focusNode: emailNode,
        validator: (text) => text.isNotEmpty ? null : "Email cannot be blank",
        controller: widget.emailController,
        onFieldSubmitted: (text) {
          emailNode.unfocus();
          FocusScope.of(context).requestFocus(passwordNode);
        },
        decoration: InputDecoration(
          labelText: "Email",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
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
                  _buildEmailField(),
                  _buildPasswordField(),
                  Container(
                    margin: EdgeInsets.only(top: widget.margin),
                    child: RaisedButtonDI(
                      onPressed: () => {
                            widget.onLoginTapped(
                              username: widget.emailController.text,
                              password: widget.passwordController.text,
                            )
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
      ),
    );
  }
}
