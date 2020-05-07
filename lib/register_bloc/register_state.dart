part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterPhoneSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;

  const RegisterFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'RegisterFailure { error: $error }';
}
class RegisterPhoneFailure extends RegisterState {
  final String error;

  const RegisterPhoneFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'RegisterPhoneFailure { error: $error }';
}