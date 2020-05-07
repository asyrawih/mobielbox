import 'dart:async';
import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:mobilbox/authentication/authentication.dart';
import 'package:mobilbox/repositories/repositories.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  RegisterBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonPressed) {
      yield* _mapFormSubmittedToState(event.firstName, event.lastName, event.phone);
    } else if (event is VerifySubmitted) {
      yield* _mapVerifyFormToState(event.phone, event.otp, event.password);
    }
  }
  Stream<RegisterState> _mapFormSubmittedToState(String firstName,
    String lastName,
    String phone) async* {
      yield RegisterLoading();
      try {
        Response response = await userRepository.registerPhone(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
      );
        if(response.statusCode == 200) {
        yield RegisterPhoneSuccess();
        } else {
        yield RegisterPhoneFailure(error: "error");
        }
      } catch (error) {
        yield RegisterPhoneFailure(error: error.toString());
      }
  }

  Stream<RegisterState> _mapVerifyFormToState(String phone,
    String otp,
    String password) async* {
      yield RegisterLoading();
      try {
        print("Working");
        final token = await userRepository.verifyPhone(
        phone: phone,
        otp: otp,
        password: password
      );
      authenticationBloc.add(LoggedIn(token: token));
        if(token != null) {
        yield RegisterSuccess();
      } else {
        yield RegisterFailure(error: "error");
      }
        yield RegisterSuccess();
      } catch (error) {
        yield RegisterFailure(error: error.toString());
      }
    
  }
}