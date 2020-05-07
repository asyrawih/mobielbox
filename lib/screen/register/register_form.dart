import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilbox/style/theme.dart' as Style;
import 'package:mobilbox/register_bloc/register_bloc.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _code = TextEditingController();
  String phone;
  PageController pageController =
      PageController(viewportFraction: 1, keepPage: true);
  @override
  void initState() {
    super.initState();
    phone = "";
  }
  @override
  Widget build(BuildContext context) {
    
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Бүртгэл амжилтгүй боллоо.'),
              backgroundColor: Colors.red,
            ),
          );
          Future.delayed(const Duration(milliseconds: 3000), () {
            Navigator.pop(context);
        });
          
        }
        if (state is RegisterSuccess) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Бүртгэл амжилттай хийгдлээ.'),
              backgroundColor: Colors.green,
            ),
          );
          Future.delayed(const Duration(milliseconds: 3000), () {
            Navigator.pop(context);

});
        }
        if (state is RegisterPhoneSuccess) {
          pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.decelerate);
          FocusScope.of(context).requestFocus(FocusNode());
        }
        if (state is RegisterFailure) {
          showVerifyErrorDialog(context);
        }
        if (state is RegisterPhoneFailure) {
          showErrorDialog(context);
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: <Widget>[
              Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Style.Colors.titleColor,
                              fontWeight: FontWeight.bold),
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Style.Colors.mainColor),
                                borderRadius: BorderRadius.circular(8.0)),
                            contentPadding: EdgeInsets.only(
                                left: 10.0, top: 20.0, right: 16.0, bottom: 5.0),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54),
                                borderRadius: BorderRadius.circular(8.0)),
                            labelText:
                                "Овог",
                            hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Style.Colors.grey,
                                fontWeight: FontWeight.bold),
                            labelStyle: TextStyle(
                                fontSize: 13.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          autocorrect: false,
                          autovalidate: true,
                        ),
                        SizedBox(height: 15.0),
                        TextFormField(
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Style.Colors.titleColor,
                              fontWeight: FontWeight.bold),
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Style.Colors.mainColor),
                                borderRadius: BorderRadius.circular(8.0)),
                            contentPadding: EdgeInsets.only(
                                left: 10.0, top: 20.0, right: 16.0, bottom: 5.0),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54),
                                borderRadius: BorderRadius.circular(8.0)),
                            labelText:
                                "Нэр",
                            hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Style.Colors.grey,
                                fontWeight: FontWeight.bold),
                            labelStyle: TextStyle(
                                fontSize: 13.0,
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
                          controller: _phoneController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8),
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Style.Colors.mainColor),
                                borderRadius: BorderRadius.circular(8.0)),
                            contentPadding: EdgeInsets.only(
                                left: 10.0, top: 20.0, right: 16.0, bottom: 5.0),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54),
                                borderRadius: BorderRadius.circular(8.0)),
                            labelText:
                                "Утасны дугаар",
                            hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Style.Colors.grey,
                                fontWeight: FontWeight.bold),
                            labelStyle: TextStyle(
                                fontSize: 13.0,
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
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Style.Colors.mainColor),
                                borderRadius: BorderRadius.circular(8.0)),
                            contentPadding: EdgeInsets.only(
                                left: 10.0, top: 20.0, right: 16.0, bottom: 5.0),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54),
                                borderRadius: BorderRadius.circular(8.0)),
                            labelText:
                                "Нууц үг",
                            hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Style.Colors.grey,
                                fontWeight: FontWeight.bold),
                            labelStyle: TextStyle(
                                fontSize: 13.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          autocorrect: false,
                          obscureText: true,
                          autovalidate: true,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      SizedBox(
                        height: 10.0,
                      ),
                        SizedBox(
                          height: 45,
                          child: state is RegisterLoading
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 25.0,
                                      width: 25.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                Style.Colors.mainColor),
                                        strokeWidth: 4.0,
                                      ),
                                    )
                                  ],
                                )
                              : RaisedButton(
                                  color: Style.Colors.mainColor,
                                  disabledColor: Style.Colors.mainColor,
                                  disabledTextColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  onPressed: () {
                                    _onFormSubmitted();
                                    setState(() {
                                      phone = _phoneController.text;
                                    });
                                  },
                                  child: Text(
                                      "Үргэлжлүүэх",
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)))),
                      ],
                    ),
                  ), 
                  Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      child: ListView(
                          children: <Widget>[
                            Text("Таны $phone дугаартай утсанд баталгаажуулах кодыг мессежээр явууллаа. Кодоо оруулж баталгаажуулна уу.", style: TextStyle(
                              color: Style.Colors.titleColor,
                              fontSize: 14.0
                            ),),
                            PinCodeTextField(
                              autofocus: true,
                              controller: _code,
                              hideCharacter: false,
                              highlightColor: Style.Colors.mainColor,
                              defaultBorderColor: Colors.black,
                              hasTextBorderColor: Style.Colors.mainColor,
                              maxLength: 6,
                              pinBoxWidth: MediaQuery.of(context).size.width / 8,
                              onDone: (text) {
                                print("DONE $text");
                              },
                              wrapAlignment: WrapAlignment.center,
                              pinBoxDecoration: ProvidedPinBoxDecoration
                                  .underlinedPinBoxDecoration,
                              pinTextStyle: TextStyle(fontSize: 20.0),
                              pinTextAnimatedSwitcherTransition:
                                  ProvidedPinBoxTextAnimation.scalingTransition,
                              pinTextAnimatedSwitcherDuration:
                                  Duration(milliseconds: 10),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                          height: 45,
                          child: state is RegisterLoading
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 25.0,
                                      width: 25.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                Style.Colors.mainColor),
                                        strokeWidth: 4.0,
                                      ),
                                    )
                                  ],
                                )
                              : RaisedButton(
                                  color: Style.Colors.mainColor,
                                  disabledColor: Style.Colors.mainColor,
                                  disabledTextColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  onPressed: () {
                                    _onVerifySubmitted();
                                  },
                                  child: Text(
                                      "Баталгаажуулах",
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)))),
                            SizedBox(
                              height: 10.0,
                            ),
                          ]))
            ],
          );
        },
      ),
    );
  }
  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 55,
        child: Column(
          children: <Widget>[
            Icon(
              EvaIcons.alertCircleOutline,
              color: Colors.redAccent,
              size: 30.0,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Бүх талбарыг бөглөнө үү",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showPasswordAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 55,
        child: Column(
          children: <Widget>[
            Icon(
              EvaIcons.alertCircleOutline,
              color: Colors.redAccent,
              size: 30.0,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Нууц үг хоорондоо таарсангүй.",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  void _onFormSubmitted() {
    if (_firstNameController.text != "" &&
        _lastNameController.text != "" &&
        _phoneController.text != "" &&
        _passwordController.text != '') {
      if (_passwordController.text.length > 8) {
          print(_phoneController.text);
          BlocProvider.of<RegisterBloc>(context).add(RegisterButtonPressed(firstName: _firstNameController.text,
                lastName: _lastNameController.text,
                phone: _phoneController.text),);
      } else {
        showPasswordDialog(context);
      }
    } else {
      showAlertDialog(context);
    }
  }
  void _onVerifySubmitted() {
    BlocProvider.of<RegisterBloc>(context).add(VerifySubmitted(phone: _phoneController.text,
                otp: _code.text,
                password: _passwordController.text),);
  }
  showPasswordDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 55,
        child: Column(
          children: <Widget>[
            Icon(
              EvaIcons.alertCircleOutline,
              color: Colors.redAccent,
              size: 30.0,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Нууц үг 8 тэмдэгтээс их байх ёстойг анхаарна уу",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showErrorDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 70,
        child: Column(
          children: <Widget>[
            Icon(
              EvaIcons.alertCircleOutline,
              color: Colors.redAccent,
              size: 30.0,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Error2",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showSuccessDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 55,
        child: Column(
          children: <Widget>[
            Icon(
              EvaIcons.checkmarkCircle,
              color: Colors.greenAccent,
              size: 30.0,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Амжилттай",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showVerifyErrorDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 70,
        child: Column(
          children: <Widget>[
            Icon(
              EvaIcons.alertCircleOutline,
              color: Colors.redAccent,
              size: 30.0,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Код буруу",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}