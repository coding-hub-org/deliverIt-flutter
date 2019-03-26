import 'dart:async';

import 'package:deliverit/blocs/authentication/authentication.dart';
import 'package:deliverit/blocs/login/login_event.dart';
import 'package:deliverit/blocs/login/login_state.dart';
import 'package:deliverit/respositories/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

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
        /// TODO get token from login authentication
        await Future.delayed(Duration(seconds: 2));
        final token = "dummy";

        // final token = await authenticationBloc.userRepository.authenticate(
        //   username: event.username,
        //   password: event.password,
        // );

        authenticationBloc.dispatch(Login(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
