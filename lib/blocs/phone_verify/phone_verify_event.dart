abstract class PhoneVerifyEvent {}

class SendCodePressed extends PhoneVerifyEvent {
  @override
  String toString() => 'SendCodePressed';
}

class ResendCodePressed extends PhoneVerifyEvent {
  @override
  String toString() => 'ResendCodePressed';
}

class CodeTimeout extends PhoneVerifyEvent {
  @override
  String toString() => 'CodeTimeoutPressed';
}
