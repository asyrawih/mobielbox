import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilbox/screen/register/register_screen.dart';
import 'package:mobilbox/style/theme.dart' as Style;
import 'package:mobilbox/login/bloc/login_bloc.dart';
import 'package:mobilbox/repositories/repositories.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  LoginForm({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepository userRepository;
  _LoginFormState(this.userRepository);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(username: _usernameController.text, password: _passwordController.text,),);
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
            child: Form(
              child: ListView(
                children: [
                  Container(
                    height: 80.0,
                    child: Image.asset("assets/images/boxlogo.jpg")),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Style.Colors.titleColor,
                            fontWeight: FontWeight.bold),
                        controller: _usernameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(8.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(8.0)),
                          contentPadding: EdgeInsets.only(
                              left: 10.0, top: 20.0, right: 16.0, bottom: 5.0),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(8.0)),
                          labelText: "И-Мэйл хаяг",
                          hintStyle: TextStyle(
                              fontSize: 12.0,
                              color: Style.Colors.grey,
                              fontWeight: FontWeight.bold),
                          labelStyle: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        autocorrect: false,
                        autovalidate: true,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Style.Colors.titleColor,
                            fontWeight: FontWeight.bold),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(8.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black45),
                              borderRadius: BorderRadius.circular(8.0)),
                          contentPadding: EdgeInsets.only(
                              left: 10.0, top: 20.0, right: 16.0, bottom: 5.0),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black45),
                              borderRadius: BorderRadius.circular(8.0)),
                          labelText: "Нууц үг",
                          hintStyle: TextStyle(
                              fontSize: 12.0,
                              color: Style.Colors.grey,
                              fontWeight: FontWeight.bold),
                          labelStyle: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        autocorrect: false,
                        autovalidate: true,
                        obscureText: true,
                      ),
                      SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
          child: new InkWell(
              child: new Text("Нууц үгээ мартсан уу?", style: TextStyle(
                color: Colors.black45,
                fontSize: 12.0
              ),),
              onTap: () {
                
              }
          ),),
          Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                    height: 45,
                    child: state is LoginLoading ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                                    height: 25.0,
                                    width: 25.0,
                                                      child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Style.Colors.mainColor),
                      strokeWidth: 4.0,
                    ),
                                  ) 
                      ],
                    ) : 
    RaisedButton(
      color: Style.Colors.mainColor,
      disabledColor: Style.Colors.mainColor,
      disabledTextColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      onPressed: _onLoginButtonPressed,
      child: Text("Нэвтрэх", style: new TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white))
    )
                  ),
                        ],
                      ),
                    ),
          SizedBox(
                      height: 20.0,
                    ),
                    Container(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Шинэ хэрэглэгч үү?",
                  style: TextStyle(color: Style.Colors.grey),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(userRepository: userRepository,),
                    ),
                  );
                    },
                    child: Text(
                      "Бүртгүүлэх",
                      style: TextStyle(
                          color: Style.Colors.mainColor,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}