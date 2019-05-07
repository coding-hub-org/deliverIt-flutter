import 'package:deliverit/widgets/custom_input_field.dart';
import 'package:deliverit/widgets/raised_button_di.dart';
import 'package:deliverit/widgets/sign_up_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deliverit/blocs/authentication/authentication.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordConfirmController = TextEditingController();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    double statusBarHeight = MediaQuery.of(context).padding.top;
    double usingHeight = MediaQuery.of(context).size.height - statusBarHeight;
    print(usingHeight);

    double margin = 20;

    var questionStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    onSignUpTapped({String email, String password}) {}

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: ListView(
                  children: <Widget>[
                    Center(
                        child: Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    )),
                    SignUpForm(
                      formKey: formKey,
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                      emailController: usernameController,
                      passwordController: passwordController,
                      confirmPasswordController: passwordConfirmController,
                      onSignUpTapped: onSignUpTapped,
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
                    "Already has an account? ",
                    style: questionStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Login tapped");
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Login here",
                      style: questionStyle.copyWith(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
