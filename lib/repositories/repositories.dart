import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mobilbox/model/product_response.dart';


class UserRepository {
  var loginUrl = 'https://api.zochil.shop/v1/users/login-with-facebook';
  var updateProfile = 'https://api.zochil.shop/v1/users/update-profile';
  var registerApi = 'https://api.zochil.shop/v1/users/register';
  var registerPhoneApi = 'https://api.zochil.shop/v1/users/register-with-phone';
  var phoneVerifyApi = 'https://api.zochil.shop/v1/users/verify-phone';
  var loginApi = 'https://api.zochil.shop/v1/users/login';
  var resetPasswordAPI = '';
  var getProductsGears = 'https://api.zochil.shop/v1/products/by-shop/81?category_id=1142';
  var getProductLeasing = 'https://api.zochil.shop/v1/products/by-shop/81?category_id=1719';
  

  final Dio _dio = Dio();
  final storage = new FlutterSecureStorage();

  String value;

  Future<ProductResponse> getGearProducts() async {
    
    try {
      Response response =
          await _dio.get(getProductsGears);
      print(response.data);
      return ProductResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductResponse.withError("$error");
    }
  }

  Future<ProductResponse> getLeasingProducts() async {
    
    try {
      Response response =
          await _dio.get(getProductLeasing);
      print(response.data);
      return ProductResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductResponse.withError("$error");
    }
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<void> setFirstHomeScreen() async {
    await storage.write(key: 'firstHomeScreen', value: "isLoaded");
  }

  Future<String> getFirstHomeScreen() async {
    var value = await storage.read(key: 'firstHomeScreen');
    return value;
  }

  Future<void> setFirstProductScreen() async {
    await storage.write(key: 'firstProductScreen', value: "isLoaded");
  }

  Future<String> getFirstProductScreen() async {
    var value = await storage.read(key: 'firstProductScreen');
    return value;
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<bool> hasToken() async {
    value = await storage.read(key: 'token');
    print(value);
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getToken() async {
    var value = await storage.read(key: 'token');
    return value;
  }

  Future<String> login(String phone, String password) async {
    Response response = await _dio.post(loginApi, data: {
      "phone": phone,
      "password": password,
    });
    return response.data["access_token"];
  }

  Future<http.Response> register(
      {String firstName,
      String lastName,
      String phone,
      String email,
      String password}) async {
    Map data = {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'password': password
    };
    var body = json.encode(data);
    var response = await http.post(registerApi,
        headers: {
          "Content-Type": "application/json",
        },
        body: body);
    print("${response.statusCode}");
    print("THIS IS BODY ${response.body}");
    return response;
  }

  Future<String> verifyPhone({
    String phone,
    String otp,
    String password,
  }) async {
    Response response = await _dio.post(phoneVerifyApi, data: {
      'phone': phone,
      'otp': otp,
      'password': password,
    });
    return response.data["access_token"];
  }

  Future<http.Response> resetPasswordPhone({
    String phone,
  }) async {
    Map data = {
      'phone': phone,
    };
    var body = json.encode(data);
    var response = await http.post(resetPasswordAPI,
        headers: {
          "Content-Type": "application/json",
        },
        body: body);
    print("${response.statusCode}");
    print("THIS IS BODY ${response.body}");
    return response;
  }

  Future<http.Response> registerPhone({
    String firstName,
    String lastName,
    String phone,
  }) async {
    Map data = {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
    };
    var body = json.encode(data);
    var response = await http.post(registerPhoneApi,
        headers: {
          "Content-Type": "application/json",
        },
        body: body);
    print("${response.statusCode}");
    print("THIS IS BODY ${response.body}");
    return response;
  }

  Future<void> signUp(
      {String firstName,
      String lastName,
      String phone,
      String email,
      String token}) async {
    Map data = {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email
    };
    var body = json.encode(data);
    var response = await http.post(updateProfile,
        headers: {"Content-Type": "application/json", "access-token": "$token"},
        body: body);
    print("${response.statusCode}");
    print("THIS IS BODY ${response.body}");
    return response;
  }

  
}