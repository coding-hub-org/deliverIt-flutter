import 'package:meta/meta.dart';

abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class SignUp extends AuthenticationEvent {
  @override
  String toString() => 'SignUp';
}

class Login extends AuthenticationEvent {
  Login({@required this.token});

  final String token;

  @override
  String toString() => 'Login';
}

class Logout extends AuthenticationEvent {
  @override
  String toString() => 'Logout';
}
