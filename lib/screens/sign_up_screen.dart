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

    double statusBarHeight = MediaQuery.of(context).padding.top;
    double usingHeight = MediaQuery.of(context).size.height - statusBarHeight;
    print(usingHeight);

    double margin = 20;

    var questionStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

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
                    Container(
                        margin: EdgeInsets.only(top: margin),
                        child: TextFormField(
                          controller: firstNameController,
                          obscureText: true,
                          decoration: InputDecoration(labelText: "First Name"),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: margin),
                        child: TextFormField(
                          controller: lastNameController,
                          obscureText: true,
                          decoration: InputDecoration(labelText: "Last Name"),
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
                        child: TextFormField(
                          controller: passwordConfirmController,
                          obscureText: true,
                          decoration:
                              InputDecoration(labelText: "Confirm Password"),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: EdgeInsets.only(top: margin),
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        elevation: 1,
                        highlightElevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {},
                        child: Text(
                          "REGISTER",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
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
