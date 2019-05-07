abstract class AuthenticationState {}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';
}

class Authenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class Unauthenticated extends AuthenticationState {
  Unauthenticated({this.errorMessage});

  @override
  String toString() => 'AuthenticationUnauthenticated';

  final String errorMessage;
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading ';
}
