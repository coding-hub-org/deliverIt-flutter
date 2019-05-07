import 'package:bloc/bloc.dart';
import 'package:deliverit/respositories/user_repository.dart';
import 'package:deliverit/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:deliverit/screens/login_screen.dart';
import 'package:deliverit/screens/sign_up_screen.dart';
import 'package:deliverit/screens/user_profile_screen.dart';

import 'package:deliverit/blocs/authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() async {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(DeliverIt(
      userRepository: UserRepository(
          sharedPreferences: await SharedPreferences.getInstance())));
}

class DeliverIt extends StatefulWidget {
  final UserRepository userRepository;

  DeliverIt({Key key, @required this.userRepository}) : super(key: key);

  @override
  State<DeliverIt> createState() => _DeliverItState();
}

class _DeliverItState extends State<DeliverIt> {
  UserRepository userRepository;
  AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    super.initState();
    authenticationBloc =
        AuthenticationBloc(userRepository: widget.userRepository);
    authenticationBloc.dispatch(AppStarted());
  }

  @override
  void dispose() {
    super.dispose();
    authenticationBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'DeliverIt',
    //   theme: _buildTheme(),
    //   home: LoginScreen(),
    //   routes: {
    //     '/login': (context) => LoginScreen(),
    //     '/signup': (context) => SignUpScreen(),
    //   },
    // );

    return BlocProvider<AuthenticationBloc>(
      bloc: authenticationBloc,
      child: MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        title: 'DeliverIt',
        theme: _buildTheme(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignUpScreen(),
          '/home': (context) => HomeScreen(),
          '/userProfile': (context) => UserProfileScreen()
        },
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationUninitialized) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is Authenticated) {
              return HomeScreen();
            }
            if (state is Unauthenticated) {
              return LoginScreen();
            }
            if (state is AuthenticationLoading) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
        buttonTheme: ButtonThemeData(
            buttonColor: Color(0xFF17B0C3),
            splashColor: Color(0xFF54d5e5),
            disabledColor: Color(0xFF17B0C3)),
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(fontSize: 16, color: Color(0xFF17B0C3)),
            hintStyle: TextStyle(fontSize: 16, color: Colors.black87),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFD4D4D4)),
                borderRadius: BorderRadius.circular(10)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFD4D4D4)),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF17B0C3)),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFD4D4D4)),
                borderRadius: BorderRadius.circular(10))));
  }
}
