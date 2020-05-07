import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilbox/model/menu.dart';
import 'package:mobilbox/style/theme.dart' as Style;

class HomeHeader extends StatelessWidget {
  final menuItems = <Menu>[
    Menu(
      title: "Гар утас даатгал",
      img: 'assets/icons/insurance.svg',
    ),
    Menu(
      title: "Нэгж цэнэглэх",
      img: 'assets/icons/money.svg',
    ),
    Menu(
      title: "Гар утас лизинг",
      img: 'assets/icons/transfer.svg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(4.0),
        shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        children: menuItems.map<Widget>((Menu menu) {
          return GestureDetector(
            onTap: () {

            },
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 90,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[200], width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: SvgPicture.asset(
                        menu.img,
                        colorBlendMode: BlendMode.darken,
                        placeholderBuilder: (BuildContext context) =>
                            new Container(
                                padding: const EdgeInsets.all(30.0),
                                child: const CircularProgressIndicator()),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      menu.title,
                      style: TextStyle(
                          color: Style.Colors.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0),
                    )
                  ],
                ),
              ),
            )
          );
        }).toList());
  }
}