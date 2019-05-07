import 'package:deliverit/widgets/custom_input_field.dart';
import 'package:deliverit/widgets/page_header.dart';
import 'package:deliverit/widgets/raised_button_di.dart';
import 'package:flutter/material.dart';

typedef void OnSignUpCallback({
  @required String email,
  @required String password,
});

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key key,
    @required this.emailController,
    @required this.passwordController,
    @required this.formKey,
    @required this.firstNameController,
    @required this.lastNameController,
    @required this.confirmPasswordController,
    this.onSignUpTapped,
  }) : super(key: key);

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final OnSignUpCallback onSignUpTapped;
  final GlobalKey<FormState> formKey;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmNode = FocusNode();

  TextStyle questionStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  void dispose() {
    firstNameNode.dispose();
    lastNameNode.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    confirmNode.dispose();
    super.dispose();
  }

  Container _buildRegisterLine(BuildContext context) {
    return Container(
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PageHeader(
            header: "Login",
          ),
          CustomInputField(
            controller: widget.firstNameController,
            labelText: "First name",
          ),
          CustomInputField(
            controller: widget.lastNameController,
            labelText: "Last name",
          ),
          CustomInputField(
            controller: widget.emailController,
            labelText: "Email",
          ),
          CustomInputField(
            controller: widget.passwordController,
            labelText: "Password",
            obscureText: true,
          ),
          CustomInputField(
            controller: widget.confirmPasswordController,
            labelText: "Confirm password",
            obscureText: true,
          ),
          Container(
            child: RaisedButtonDI(
              onPressed: () => {
                    widget.onSignUpTapped(
                      email: widget.emailController.text,
                      password: widget.passwordController.text,
                    )
                  },
              text: "LOGIN",
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
