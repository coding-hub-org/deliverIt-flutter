import 'package:deliverit/blocs/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:deliverit/screens/signup_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deliverit/blocs/authentication/authentication.dart';

class LoginScreen extends StatefulWidget {
  final Widget child;

  LoginScreen({Key key, this.child}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void initState() {
    loginBloc = LoginBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
    super.initState();
  }

  @override
  void dispose() {
    loginBloc.dispose();
    super.dispose();
  }

  Column _buildLoginForm(
      BuildContext context,
      double margin,
      TextEditingController usernameController,
      TextEditingController passwordController,
      TextStyle questionStyle) {
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.only(top: margin),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    elevation: 1,
                    highlightElevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      loginBloc.dispatch(LoginButtonPressed(
                          username: "dsadas", password: "dasdasd"));
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
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

  Center _buildLoadingOverlay() {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(color: Colors.grey),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double usingHeight = MediaQuery.of(context).size.height - statusBarHeight;

    double margin = 20;

    var questionStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    return BlocBuilder(
      bloc: loginBloc,
      builder: (context, state) {
        if (state is LoginInitial) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  _buildLoginForm(context, margin, usernameController,
                      passwordController, questionStyle),
                ],
              ),
            ),
          );
        }
        if (state is LoginLoading) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  _buildLoginForm(context, margin, usernameController,
                      passwordController, questionStyle),
                  _buildLoadingOverlay()
                ],
              ),
            ),
          );
        }
        if (state is LoginFailure) {
          return Center(
            child: Text(state.error),
          );
        }
      },
    );
  }
}
