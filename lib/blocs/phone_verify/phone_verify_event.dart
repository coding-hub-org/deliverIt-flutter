abstract class PhoneVerifyEvent {}

class SendCodePressed extends PhoneVerifyEvent {
  @override
  String toString() => 'SendCodePressed';
}

class ResendCodePressed extends PhoneVerifyEvent {
  @override
  String toString() => 'ResendCodePressed';
}

class SMSTimeout extends PhoneVerifyEvent {
  @override
  String toString() => 'SMSTimeout';
}
