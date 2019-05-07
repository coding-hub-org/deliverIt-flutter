import 'package:deliverit/blocs/login/login.dart';
import 'package:deliverit/widgets/login_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:deliverit/screens/sign_up_screen.dart';

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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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

  Center buildLoadingOverlay() {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void onLoginTapped({String username, String password}) {
    bool validateResult = formKey.currentState.validate();

    print("validate result: $validateResult");
    if (validateResult) {
      loginBloc
          .dispatch(LoginButtonPressed(email: username, password: password));
    }
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double usingHeight = MediaQuery.of(context).size.height - statusBarHeight;

    double margin = 20;

    var questionStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: BlocListener(
          bloc: loginBloc,
          listener: (context, state) {
            if (state is LoginFailure) {
              // Show error message on snackbar
              scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          child: BlocBuilder(
            bloc: loginBloc,
            builder: (context, state) {
              if (state is LoginInitial) {
                return LoginForm(
                  formKey: formKey,
                  margin: margin,
                  emailController: usernameController,
                  passwordController: passwordController,
                  questionStyle: questionStyle,
                  onLoginTapped: onLoginTapped,
                );
              }

              if (state is LoginLoading) {
                return Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.5,
                      child: LoginForm(
                        formKey: formKey,
                        margin: margin,
                        emailController: usernameController,
                        passwordController: passwordController,
                        onLoginTapped: onLoginTapped,
                        questionStyle: questionStyle,
                      ),
                    ),
                    buildLoadingOverlay(),
                  ],
                );
              }

              if (state is LoginFailure) {
                return Stack(
                  children: <Widget>[
                    LoginForm(
                      formKey: formKey,
                      margin: margin,
                      emailController: usernameController,
                      passwordController: passwordController,
                      onLoginTapped: onLoginTapped,
                      questionStyle: questionStyle,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
