import 'package:deliverit/blocs/login/login.dart';
import 'package:deliverit/widgets/login_form.dart';
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
              child: LoginForm(
                  loginBloc: loginBloc,
                  context: context,
                  margin: margin,
                  usernameController: usernameController,
                  passwordController: passwordController,
                  questionStyle: questionStyle),
            ),
          );
        }
        if (state is LoginLoading) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  LoginForm(
                      loginBloc: loginBloc,
                      context: context,
                      margin: margin,
                      usernameController: usernameController,
                      passwordController: passwordController,
                      questionStyle: questionStyle),
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
