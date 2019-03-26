import 'package:meta/meta.dart';

abstract class PhoneVerifyState {}

class PhoneVerifyInitial extends PhoneVerifyState {
  @override
  String toString() => 'PhoneInitial';
}

class PhoneVerifyLoading extends PhoneVerifyState {
  @override
  String toString() => 'PhoneLoading';
}

class PhoneVerifyFailure extends PhoneVerifyState {
  final String error;

  PhoneVerifyFailure({@required this.error});

  @override
  String toString() => 'PhoneVerifyFailure { error: $error }';
}

class SMSVerify extends PhoneVerifyState {
  @override
  String toString() => 'SMSVerify';
}

class SMSVerifyTimeout extends PhoneVerifyState {
  @override
  String toString() => 'SMSVerifyTimeout';
}

class SMSVerifyFailure extends PhoneVerifyState {
  final String error;

  SMSVerifyFailure({@required this.error});

  @override
  String toString() => 'SMSVerifyFailure { error: $error }';
}

class SMSVerifySuccess extends PhoneVerifyState {
  @override
  String toString() => 'PhoneVerifySuccess';
}
