import 'dart:convert';

import 'package:AtDocHUB/Controller/LoginController.dart';
import 'package:AtDocHUB/Model/User.dart';
import 'package:AtDocHUB/View/LoginPage.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ResetPassword extends StatefulWidget {
  final String email;
  ResetPassword({required this.email});

  @override
  ResetPasswordState createState() => ResetPasswordState(this.email);
}

class ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = false;
  bool obscureText = false;
  final String email;

  ResetPasswordState(this.email);

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      obscureText = !obscureText;
    });
    //}

    Future<UserLogin> fetchEmail(String email) async {
      final response = await http.get(Uri.parse(
          'http://192.168.0.134:8080/AtdochubJ-3/user/email?useremail=${email}'));

      if (response.statusCode == 200) {
        print('response++++ $response');
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

        return parsed
            .map<UserLogin>((json) => UserLogin.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load UserLogin');
      }
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();
  TextEditingController userPasswordcontroller = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          title: Text('Reset Password'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()));
              })),
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              style: TextStyle(fontSize: 14),
                              keyboardType: TextInputType.name,
                              controller: otpcontroller,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  // labelText: 'OPT',
                                  hintText: "Enter verification code",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter code ';
                                }

                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: !_obscureText,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: userPasswordcontroller,

                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: _toggle,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 15.0, 20.0, 15.0),
                                hintText: "Enter new password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0))),

                            // The validator receives the text that the user has entered.
                            validator: (pws) {
                              if (pws == null || pws.isEmpty) {
                                return 'Please enter New Password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: !obscureText,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: confirmPassword,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: _toggle,
                                ),
                                //),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 15.0, 20.0, 15.0),
                                hintText: "Enter confirm password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0))),
                            validator: (pws) {
                              if (pws == null || pws.isEmpty) {
                                return 'Please enter confirm password';
                              } else if (pws != userPasswordcontroller.text) {
                                return 'password not match';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 35,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 3, 89, 168),
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  final isValidForm =
                                      _formKey.currentState!.validate();
                                  if (isValidForm) {
                                    String email = this.email;

                                    String otp = otpcontroller.text;
                                    String password =
                                        userPasswordcontroller.text;
                                    Map data = {
                                      email: 'email',
                                      otp: 'otp',
                                      password: 'password',
                                    };
                                    var body = json.encode(data);
                                    var response = await http.post(
                                        Uri.parse(
                                            "http://3.108.194.111:8080/AtdochubJ-3/verify-otp?email=${email}&otp=${otp}&password=${password}"),
                                        headers: {
                                          "Content-Type": "application/json",
                                          "Accept": "application/json"
                                        },
                                        body: body);

                                    if (response.statusCode == 201 ||
                                        response.statusCode == 200 &&
                                            userPasswordcontroller.text ==
                                                confirmPassword.text) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginPage(
                                                  // email: emailController.text,
                                                  ),
                                        ),
                                        (route) => false,
                                      );

                                      Fluttertoast.showToast(
                                          msg: "Password Reset Sucessfully",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor:
                                              Color.fromARGB(255, 3, 87, 156),
                                          textColor: Colors.white,
                                          fontSize: 12.0);
                                    } else if (response.statusCode == 406) {
                                      Fluttertoast.showToast(
                                          msg: "Invalid OTP",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor:
                                              Color.fromARGB(255, 3, 87, 156),
                                          textColor: Colors.white,
                                          fontSize: 12.0);
                                    } else if (response.statusCode != 200 ||
                                        response.statusCode != 201 ||
                                        userPasswordcontroller.text !=
                                            confirmPassword.text) {
                                      Fluttertoast.showToast(
                                          msg: "Unable To Reset Password",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor:
                                              Color.fromARGB(255, 3, 87, 156),
                                          textColor: Colors.white,
                                          fontSize: 12.0);
                                    }
                                  }
                                },
                                child: const Text("Save"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 3, 89, 168))),
                              ))
                        ],
                      ))))));
}
