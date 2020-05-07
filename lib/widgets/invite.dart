import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobilbox/style/theme.dart' as Style;

class Invite extends StatefulWidget {
  @override
  _InviteState createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
          child: 
          Row(
                children: <Widget>[
                  SizedBox(
                      height: 20,
                      width: 20,
                      child: SvgPicture.asset(
                        "assets/icons/patient.svg",
                        colorBlendMode: BlendMode.darken,
                        placeholderBuilder: (BuildContext context) =>
                            new Container(
                                padding: const EdgeInsets.all(30.0),
                                child: const CircularProgressIndicator()),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Найзаа урих".toUpperCase(), style: TextStyle(
            color: Style.Colors.titleColor,
            fontWeight: FontWeight.w500,
            fontSize: 10.0
          ),),
                ],
              ),
          
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          children: <Widget>[
            Container(
          width: MediaQuery.of(context).size.width - 100.0,
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Style.Colors.mainColor,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                            LengthLimitingTextInputFormatter(8),
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black45),
                              borderRadius: BorderRadius.circular(8.0)),
                          contentPadding: EdgeInsets.only(
                              left: 10.0, top: 20.0, right: 16.0, bottom: 5.0),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.grey[100]),
                              borderRadius: BorderRadius.circular(8.0)),
                          enabledBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.grey[200]),
                              borderRadius: BorderRadius.circular(8.0)),
                          labelText:
                              "Утасны дугаар",
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Style.Colors.titleColor,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        autocorrect: false,
                        autovalidate: true,
                      ),
        ),
            SizedBox(
                        height: 45,
                        child: RaisedButton(
                          color: Style.Colors.mainColor,
                          disabledColor:
                              Style.Colors.mainColor.withOpacity(0.2),
                          disabledTextColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          onPressed: (){},
                          child: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.solidPaperPlane, color: Colors.white, size: 14.0,),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                  "Урих",
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          )
                        )),
          ],
        )
        
      ],
    );
  }
}