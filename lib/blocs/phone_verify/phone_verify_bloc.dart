import 'package:bloc/bloc.dart';
import 'package:deliverit/blocs/phone_verify/phone_verify_state.dart';
import 'package:deliverit/blocs/phone_verify/phone_verify_event.dart';
import 'package:deliverit/respositories/user_repository.dart';
import 'package:meta/meta.dart';

class PhoneVerifyBloc extends Bloc<PhoneVerifyEvent, PhoneVerifyState> {
  final UserRepository userRepository;

  PhoneVerifyBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  PhoneVerifyState get initialState => PhoneVerifyInitial();

  @override
  Stream<PhoneVerifyState> mapEventToState(
    PhoneVerifyState currentState,
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

    if (event is CodeTimeout) {
      yield PhoneVerifyTimeout();
    }
  }
}
