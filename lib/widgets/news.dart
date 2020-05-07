import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobilbox/bloc/product_leasing_list_bloc.dart';
import 'package:mobilbox/model/news.dart';
import 'package:mobilbox/model/product.dart';
import 'package:mobilbox/model/product_response.dart';
import 'package:mobilbox/style/theme.dart' as Style;

import 'product_detail.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  final news = <NewsModel>[
    NewsModel(
      title: "iPhone 11",
      date: "2020.02.01",
      img: 'assets/img/iphone11.jpeg'
    ),
    NewsModel(
      title: "Samsung S10",
      date: "2019.01.12",
      img: 'assets/img/s10.jpeg'
    ),
    NewsModel(
      title: "Huawei P30 Pro",
      date: "2018.09.17",
      img: 'assets/img/p30pro.jpg'
    ),
  ];
  @override
  void initState() {
    super.initState();
    productsLeasingBloc..getLeasingProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                      height: 20,
                      width: 20,
                      child: SvgPicture.asset(
                        "assets/icons/phone.svg",
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
                    Text("Гар утас худалдаа, лизинг".toUpperCase(), style: TextStyle(
            color: Style.Colors.titleColor,
            fontWeight: FontWeight.w500,
            fontSize: 10.0
          ),),
                ],
              ),
          Text("Бүгд".toUpperCase(), style: TextStyle(
            color: Style.Colors.secondColor,
            fontWeight: FontWeight.bold,
            fontSize: 10.0
          ),),
            ],
          )
          
        ),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<ProductResponse>(
        stream: productsLeasingBloc.subject.stream,
        builder: (context, AsyncSnapshot<ProductResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildAccessoriesWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error);
          } else {
            return _buildLoadingWidget();
          }
        },
      )
      ],
    );
    
  }
  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CircularProgressIndicator(
            valueColor:
                new AlwaysStoppedAnimation<Color>(Style.Colors.mainColor),
            strokeWidth: 4.0,
          ),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }
  Widget _buildAccessoriesWidget(ProductResponse data) {
    List<Product> products = data.products;
    return  Container(
                               height: 210,
                            child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                                var productImg = json.decode(products[index].images);
                                return GestureDetector(
                                    onTap: () {
                            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetail(

                              product: products[index],
                            )));
                          },
                                                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 10.0,
                                      top: 10.0,
                                      bottom: 10.0,
                                    ),
                                    child: Container(
                                    width: 120,
                                    child: Stack(
                                      children: <Widget>[
                                        Hero(
                                          tag: products[index].id,
                                                                                      child: Container(
                                              width: 250.0,
                                              height: 210.0,
                                              decoration: new BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15.0)),
                                                shape: BoxShape.rectangle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                      productImg[0]["url"])),
                                              )),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0)),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                stops: [
                                                  0.1,
                                                  0.9
                                                ],
                                                colors: [
                                                  Colors.black.withOpacity(0.6),
                                                  Colors.white.withOpacity(0.0)
                                                ]),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 30.0,
                                          left: 10.0,
                                          child: Container(
                                            width: 180.0,
                                            child: Text(
                                              products[index].name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12.0),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 10.0,
                                            left: 10.0,
                                            child: Text(
                                              products[index].price,
                                              style: TextStyle(
                                                  color: Colors.white54,
                                                  fontSize: 9.0),
                                            )),
                                      ],
                                    ),
                                      ),
                                  ),
                                );
                            },
                          ),
                             );
  }
}