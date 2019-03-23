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

class PhoneVerifyTimeout extends PhoneVerifyState {
  @override
  String toString() => 'PhoneVerifyTimeout';
}

class PhoneVerifyFailure extends PhoneVerifyState {
  final String error;

  PhoneVerifyFailure({@required this.error});

  @override
  String toString() => 'PhoneVerifyFailure { error: $error }';
}

class PhoneVerifySuccess extends PhoneVerifyState {
  @override
  String toString() => 'PhoneLoading';
}
