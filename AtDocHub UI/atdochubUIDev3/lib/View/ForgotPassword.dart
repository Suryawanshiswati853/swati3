// ignore_for_file: unused_field

import 'dart:convert';
import 'dart:io';

import 'package:AtDocHUB/Model/User.dart';
import 'package:AtDocHUB/View/LoginPage.dart';
import 'package:AtDocHUB/View/ResetPassword.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  Future<UserLogin>? _futureUser;

  static var role;

  final _formKey = GlobalKey<FormState>();
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  List<UserLogin> logs = [];
  List<UserLogin> userRole = [];
  String email = '';

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          title: Text('Forgot Password'),
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
                      padding: const EdgeInsets.all(8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(' Please enter your email address',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                                child: Text(
                                    'Enter your email we will send you verification code',
                                    style: TextStyle(fontSize: 15))),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                                width: 450,
                                child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: emailController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                        labelText: 'Email',
                                        hintText: "Enter the email",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0))),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email is required';
                                      } else if (!EmailValidator.validate(
                                          value)) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    })),
                            //),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                                child: ElevatedButton(
                              onPressed: () async {
                                final isValidForm =
                                    _formKey.currentState!.validate();
                                if (isValidForm) {
                                  final String email = emailController.text;

                                  Map data = {
                                    email: 'email',
                                  };
                                  var body = json.encode(data);
                                  var response = await http.post(
                                      Uri.parse(
                                          "http://3.108.194.111:8080/AtdochubJ-3/send-otp?email=${email}"),
                                      headers: {
                                        "Content-Type": "application/json",
                                        "Accept": "application/json"
                                      },
                                      body: body);

                                  if (response.statusCode == 102) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(""),
                                            content: Text("Processing"),
                                          );
                                        });
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ForgotPassword(
                                                // email: emailController.text,
                                                ),
                                      ),
                                      (route) => false,
                                    );
                                  } else if (response.statusCode == 201 ||
                                      response.statusCode == 200) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ResetPassword(
                                          email: emailController.text,
                                        ),
                                      ),
                                      (route) => false,
                                    );
                                    print('success');
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (BuildContext context) {
                                    //       return AlertDialog(
                                    //         title: Text("Success"),
                                    //         content: Text("Saved successfully"),
                                    //       );
                                    //     });

                                    Fluttertoast.showToast(
                                        msg: " Email Send Sucessfully",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            Color.fromARGB(255, 3, 87, 156),
                                        textColor: Colors.white,
                                        fontSize: 12.0);
                                  } else if (response.statusCode == 406) {
                                    Fluttertoast.showToast(
                                        msg: "Please check your Email",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            Color.fromARGB(255, 3, 87, 156),
                                        textColor: Colors.white,
                                        fontSize: 12.0);
                                  }
                                  // else if (response.statusCode == 102) {
                                  //   AlertDialog alert = AlertDialog(
                                  //     title: Text("My title"),
                                  //     content: Text("This is my message."),
                                  //     actions: [],
                                  //   );
                                  // }
                                }

                                // final String email = emailController.text;

                                // UserLogin res =
                                //     await LoginController.ForgetPassword(email);
                                // SharedPreferences prefs =
                                //     await SharedPreferences.getInstance();
                                // prefs.setString('email', emailController.text);
                                //   print(res);
                              },
                              // onPressed: () async {
                              //   final isValidForm = _formKey.currentState!.validate();
                              //   if (isValidForm) {
                              // try {

                              //  if (res == HttpStatus.ok && res != null)
                              //  if () {
                              //   print('email send sucessfully');
                              //  ForgetPassword(email);
                              // Fluttertoast.showToast(
                              //     msg: " Email send sucessfully",
                              //     toastLength: Toast.LENGTH_LONG,
                              //     gravity: ToastGravity.CENTER,
                              //     timeInSecForIosWeb: 1,
                              //     backgroundColor:
                              //         Color.fromARGB(255, 3, 87, 156),
                              //     textColor: Colors.white,
                              //     fontSize: 12.0);

                              // }
                              //  } catch (error, stackTrack) {
                              //  print('Email not send');
                              // print('email not send sucessfully');
                              //}
                              //     } else if (
                              //         //res[0].userEmail == email &&
                              //         res == true) {
                              //       Fluttertoast.showToast(
                              //           msg: "Email sent sucessfully",
                              //           toastLength: Toast.LENGTH_LONG,
                              //           gravity: ToastGravity.BOTTOM,
                              //           timeInSecForIosWeb: 1,
                              //           backgroundColor:
                              //               Color.fromARGB(255, 3, 87, 156),
                              //           textColor: Colors.white,
                              //           fontSize: 12.0);
                              //     }
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                              //         ResetPassword()));
                              //  },

                              child: const Text("Send OTP"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 3, 89, 168))),
                            )),
                            // Padding(
                            //     padding: const EdgeInsets.all(5.0),
                            //     child: Column(
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: [
                            //           FittedBox(
                            //               child: Padding(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: Row(
                            //               children: [
                            //                 TextButton(
                            //                   onPressed: () {},
                            //                   child: Text(
                            //                     'didn t receive an email?',
                            //                     style: TextStyle(
                            //                         fontSize: 15,
                            //                         color: Colors.grey,
                            //                         fontWeight: FontWeight.bold),
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 20,
                            //                 ),
                            //                 Align(
                            //                     alignment: Alignment.bottomLeft,
                            //                     child: InkWell(
                            //                         onTap: () async {},
                            //                         child: Text('send again  ',
                            //                             style: TextStyle(
                            //                               height: 1.2,
                            //                               fontSize: 14,
                            //                               color: Colors.blue,
                            //                               fontWeight: FontWeight.w500,
                            // ))))
                            // ],
                            //             ),
                            // ))
                          ]))))));

  //   )));
}
