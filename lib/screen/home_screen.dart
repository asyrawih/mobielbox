import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mobilbox/authentication/authentication.dart';
import 'package:mobilbox/bloc/product_gear_list_bloc.dart';
import 'package:mobilbox/bloc/product_leasing_list_bloc.dart';
import 'package:mobilbox/style/theme.dart' as Style;
import 'package:mobilbox/widgets/accessories.dart';
import 'package:mobilbox/widgets/invite.dart';
import 'package:mobilbox/widgets/news.dart';
import 'package:mobilbox/widgets/top_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(EvaIcons.menu2Outline, color: Style.Colors.mainColor,),
        title: SizedBox(
          height: 50.0,
          child: Image.asset("assets/images/boxlogo.jpg")),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
            icon: Icon(EvaIcons.logOutOutline, color: Style.Colors.mainColor,)
          )
        ],
      ),
      body: LiquidPullToRefresh(
              springAnimationDurationInMilliseconds: 500,
        color: Style.Colors.mainColor,
        height: 50.0,
        showChildOpacityTransition: false,
        onRefresh: _handleRefresh,
              child: ListView(
          children: <Widget>[
            
            Container(
              height: 120,
              child: HomeHeader(),
            ),
            Invite(),
           Accessories(),
           News()
          ],
        ),
      ),
    );
  }
  Future<void> _handleRefresh() {
    productsGearBloc..getProducts();
    productsLeasingBloc..getLeasingProducts();
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 2), () {
      completer.complete();
    });
    return completer.future.then<void>((_) {});
  }
}