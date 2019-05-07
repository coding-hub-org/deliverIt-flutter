import 'dart:async';

import 'package:deliverit/blocs/authentication/authentication.dart';
import 'package:deliverit/blocs/login/login_event.dart';
import 'package:deliverit/blocs/login/login_state.dart';
import 'package:deliverit/respositories/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.authenticationBloc,
  }) : assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        String token = await authenticationBloc.userRepository.login(
          email: event.email,
          password: event.password,
        );

        if (token == null) {
          yield LoginFailure(error: "No token");
          return;
        }

        authenticationBloc.dispatch(Login(token: token));

        yield LoginInitial();
      } on PlatformException catch (error) {
        print("error");
        print(error);
        yield LoginFailure(error: error.message);
      }
    }
  }
}
