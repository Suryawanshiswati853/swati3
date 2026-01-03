import 'dart:async';
import 'dart:io';

import 'package:AtDocHUB/Exceptions/ErrorHandler.dart';
import 'package:AtDocHUB/Model/User.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController {
  static Future<List<UserLogin>> loginAdmin() async {
    final response = await http.get(Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/user/login?useremail=reshma@gmail.com&userpassword=1221'));
    // print('email+++ ${email}');
    // print('password ${password}');
    //print(fromJson(json)).toList());
    if (response.statusCode == 200) {
      print('response++++ $response');
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<UserLogin>((json) => UserLogin.fromJson(json)).toList();

      //return Document.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Document');
    }
  }

  static Future<List<UserLogin>> users() async {
    final response = await http
        .get(Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/user/'));
    // print('email+++ ${email}');
    // print('password ${password}');
    //print(fromJson(json)).toList());
    if (response.statusCode == 200) {
      print('response++++ $response');

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<UserLogin>((json) => UserLogin.fromJson(json)).toList();

      //return Document.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Document');
    }
  }

  static Future<List<UserLogin>> login(String email, String password) async {
    print(email);
    // try {
    final response = await http.get(Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/user/login?useremail=${email}&userpassword=${password}'));
    // print('email+++ ${email}');
    // print('password ${password}');
    //print(fromJson(json)).toList());

    if (response.statusCode == 200 || response.statusCode == 201) {
      Fluttertoast.showToast(
          msg: "Login Successfull",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          textColor: Colors.white,
          fontSize: 12.0);
      print('response++++ $response');
      final parsed = jsonDecode(response.body) as List;
      return parsed.map((e) => UserLogin.fromJson(e)).toList();
    } else {
      if (response.statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Invalid Email ID",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Color.fromARGB(255, 3, 87, 156),
            textColor: Colors.white,
            fontSize: 12.0);
      } else {
        if (response.statusCode == 401) {
          Fluttertoast.showToast(
              msg: "Invalid Password!",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Color.fromARGB(255, 3, 87, 156),
              textColor: Colors.white,
              fontSize: 12.0);
        } else {
          Fluttertoast.showToast(
              msg: "Login Failed !",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Color.fromARGB(255, 3, 87, 156),
              textColor: Colors.white,
              fontSize: 12.0);
        }
      }
      throw Exception('Failed to load Document');
    }
    // on SocketException {
    // } on TimeoutException {}
  }

  dynamic processResponse(http.Response response) {
    switch (response.statusCode) {
      case 500:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }

// if (response.statusCode == 200) {

//   print('response++++ $response');
//   final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

//   return parsed.map<UserLogin>((json) => UserLogin.fromJson(json)).toList();
// } else {

// }
}
