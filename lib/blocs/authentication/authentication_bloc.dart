import 'package:bloc/bloc.dart';
import 'package:deliverit/blocs/authentication/authentication_event.dart';
import 'package:deliverit/blocs/authentication/authentication_state.dart';
import 'package:deliverit/respositories/user_repository.dart';
import 'package:meta/meta.dart';

import 'package:flutter/services.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = userRepository.hasToken();

      if (hasToken) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    }

    if (event is Login) {
      yield AuthenticationLoading();

      userRepository.persistToken(event.token);

      yield Authenticated();
    }

    if (event is Logout) {
      yield AuthenticationLoading();

      try {
        await userRepository.logout();
        yield Unauthenticated();
      } on PlatformException catch (error) {
        print("error logout");
        print(error);
        yield Unauthenticated(errorMessage: error.message);
      }
    }
  }
}
