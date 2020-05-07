import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilbox/authentication/authentication.dart';
import 'package:mobilbox/register_bloc/register_bloc.dart';
import 'package:mobilbox/repositories/repositories.dart';
import 'package:mobilbox/screen/register/register_form.dart';
import 'package:mobilbox/style/theme.dart' as Style;

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;
  
  RegisterScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        title: Text("Хэрэглэгчийн бүртгэл", style: TextStyle(
                color: Colors.white,
                fontSize: 15.0
              ),),
      ),
      body: Center(
        child: BlocProvider(
        create: (context) {
          return RegisterBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: _userRepository,
          );
        },
        child: RegisterForm(),
      ),
      ),
    );
  }
}