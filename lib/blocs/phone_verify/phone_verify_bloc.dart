import 'package:bloc/bloc.dart';
import 'package:deliverit/blocs/authentication/authentication_bloc.dart';
import 'package:deliverit/blocs/phone_verify/phone_verify_state.dart';
import 'package:deliverit/blocs/phone_verify/phone_verify_event.dart';
import 'package:meta/meta.dart';

class PhoneVerifyBloc extends Bloc<PhoneVerifyEvent, PhoneVerifyState> {
  final AuthenticationBloc authenticationBloc;

  PhoneVerifyBloc({@required this.authenticationBloc})
      : assert(authenticationBloc != null);

  @override
  PhoneVerifyState get initialState => PhoneVerifyInitial();

  @override
  Stream<PhoneVerifyState> mapEventToState(
    PhoneVerifyEvent event,
  ) async* {
    if (event is SendCodePressed) {
      /// TODO do send phone verify code
      yield PhoneVerifyInitial();
    }

    if (event is ResendCodePressed) {
      /// TODO do resend phone verify code
      yield PhoneVerifyInitial();
    }

    if (event is SMSTimeout) {
      yield SMSVerifyTimeout();
    }
  }
}
