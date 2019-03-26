import 'package:deliverit/blocs/authentication/authentication_bloc.dart';
import 'package:deliverit/blocs/phone_verify/phone_verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneVerifyScreen extends StatefulWidget {
  PhoneVerifyScreen({Key key}) : super(key: key);

  _PhoneVerifyScreenState createState() => _PhoneVerifyScreenState();
}

class _PhoneVerifyScreenState extends State<PhoneVerifyScreen> {
  PhoneVerifyBloc phoneVerifyBloc;

  void initState() {
    super.initState();
    phoneVerifyBloc = PhoneVerifyBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneVerifyEvent, PhoneVerifyState>(
      bloc: phoneVerifyBloc,
      builder: (context, state) {
        if (state is PhoneVerifyInitial) {
          return Scaffold(
            body: Container(
              child: Center(
                child: Text("Phone Verify Body"),
              ),
            ),
          );
        }
        if (state is PhoneVerifyLoading) {
          return Scaffold(
            body: Container(
              child: Center(
                child: Text("Phone Verify Loading"),
              ),
            ),
          );
        }
        if (state is PhoneVerifyFailure) {
          return Scaffold(
            body: Container(
              child: Center(
                child: Text("Phone Verify Failed"),
              ),
            ),
          );
        }
        if (state is SMSVerifyTimeout) {
          return Scaffold(
            body: Container(
              child: Center(
                child: Text("Phone Verify Timeout"),
              ),
            ),
          );
        }
      },
    );
  }
}
