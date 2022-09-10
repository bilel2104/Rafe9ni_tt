import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rafe9ni/login/loginModel.dart';

class LoginServices {
  Dio dio = Dio();
  Future login(login, password) async {
    try {
      return await dio.post(
        "http://51.38.199.214:2036/mobile/rafi9niplus/GetUserByLoginAndPw",
        data: {'login': login, 'password': password},
      );
    } catch (e) {
      print(" -------------------> $e");
    }
  }
}
