import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color mainColor = const Color(0xFF151C26);
  static const Color secondColor = const Color(0xFFec1661);
  static const Color titleColor = const Color(0xFF5a606b);
  static const Color background = const Color(0xFFF7F6FB);
  
  static const Color loginGradientStart = const Color(0xFF59499E);
  static const Color secondBlack = const Color(0xFF515C6F);
  static const Color loginGradientEnd = const Color(0xFF59499E);
  static const Color successGreen =const Color(0xFF32CD32);
  static const Color secondaryColor = const Color(0xFFfde971);
  static const Color thirdColor = const Color(0xFF515C6F);
  static const Color priceColor = const Color(0xFFEE6950);
  static const Color chapterColor = const Color(0xff515C6F);
  static const Color subTitle = const Color(0xFFa4adbe);
  static const Color textMain = const Color(0xFF848484);
  static const Color greyBack = const Color(0xFFced4db); 
  static const Color grey = const Color(0xFFa8adb7);
  static const Color red = const Color(0xFFff4d4d); 
  static const Color orange = const Color(0xFFff6348);
  static const Color strongGrey = const Color(0xFFced4db);
  
  static const primaryGradient = const LinearGradient(
    colors: const [ Color(0xFF5BC0FF), Color(0xFF0063FF)],
    stops: const [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
