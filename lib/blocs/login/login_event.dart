import 'package:meta/meta.dart';

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({
    @required this.email,
    @required this.password,
  });

  @override
  String toString() =>
      'LoginButtonPressed { email: $email, password: $password }';
}
