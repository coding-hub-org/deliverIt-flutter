import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        elevation: 1,
                        highlightElevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {},
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
                            style: questionStyle.copyWith(
                                color: Colors.pinkAccent),
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
                    },
                    child: Text(
                      "Register here",
                      style: questionStyle.copyWith(color: Colors.orange),
                    ),
                  ),
                  // CupertinoButton(
                  //   pressedOpacity: 0.5,
                  //   padding: EdgeInsets.all(0),
                  //   onPressed: () {},
                  //   child: Text(
                  //     "Register here",
                  //     style: questionStyle.copyWith(color: Colors.orange),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
