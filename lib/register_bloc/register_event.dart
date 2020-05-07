part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class VerifySubmitted extends RegisterEvent {
  final String phone;
  final String otp;
  final String password;

  const VerifySubmitted({
   @required this.phone, @required this.otp, @required this.password
  });

  @override
  List<Object> get props => [phone, otp, password];

  @override
  String toString() =>
      'RegisterButtonPressed { phone: $phone, otp: $otp }';
}

class RegisterButtonPressed extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String phone;

  const RegisterButtonPressed({
    @required this.firstName, @required this.lastName, @required this.phone
  });

  @override
  List<Object> get props => [firstName, lastName, phone];

  @override
  String toString() =>
      'RegisterButtonPressed { username: $firstName, phone: $phone }';
}