// import 'package:AtDocHUB/Controller/LoginController.dart';
// import 'package:AtDocHUB/Model/User.dart';
// import 'package:AtDocHUB/View/homePageAdmin.dart';

import 'dart:async';
import 'package:AtDocHUB/Model/User.dart';
import 'package:AtDocHUB/View/AppointmentPageFE.dart';
import 'package:AtDocHUB/View/homePageAdmin.dart';
import 'package:flutter/material.dart';
import 'package:AtDocHUB/Controller/LoginController.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ForgotPassword.dart';
//import 'package:flutter_inappwebview';

class LoginPage extends StatelessWidget {
  static String userRole = '';
  late final String createdBY;
  @override
  Widget build(BuildContext context) {
    const appTitle = 'User Login';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text(appTitle),
        // ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  String uname = '';
  bool _obscureText = false;

  late Future<UserLogin> futureLogin;

  static var role;

  //late Future _futureAuth;
  final _formKey = GlobalKey<FormState>();
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  List<UserLogin> logs = [];
  List<UserLogin> userRole = [];
  String email = '';

  String pass = '';

  // LoginController loginController = Get.put(LoginController());

  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  String playerid = '';
  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId('e89acaa4-5388-4e3a-bd69-44d197bdcbd7');
    OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {});
    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;
    setState(() {
      this.playerid = osUserID!;
    });
    print('this.playerid from main.dart ${this.playerid}');
    //  Preferences.setOnesignalUserId(osUserID);
    //OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      debugPrint('NOTIFICATION OPENED HANDLER CALLED WITH: $result');
      // setState(() {
      //   // Navigator.of(context).pushAndRemoveUntil(
      //   //     MaterialPageRoute(
      //   //         builder: (BuildContext context) => AddNewDocument()),
      //   //     (Route<dynamic> route) => false);
      // });
    });
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    //String email = emailController.text;
    //String pasw = pwController.text;
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
        child: Form(
      //  autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Center(
          child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: AutofillGroup(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(
                      height: 130,
                    ),
                    Center(
                      child: SizedBox(
                          height: 155,
                          child: Image.asset(
                            "assets/image/AtDocHublogo.png",
                            fit: BoxFit.contain,
                          )),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    TextFormField(
                      autofillHints: [AutofillHints.email],
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Email is required*'),
                      ]),
                      style: style,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      obscureText: !_obscureText,
                      controller: pwController,
                      style: style,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Password is required*'),
                      ]),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: _toggle,
                          ),

                          //isDense: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                    ),
                    SizedBox(height: 35.0),
                    MaterialButton(
                        height: 55,
                        child: Text("Login",
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        minWidth: MediaQuery.of(context).size.width,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        color: Color.fromARGB(255, 3, 89, 168),
                        // padding:
                        //     const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () async {
                          _formKey.currentState?.validate();
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            final String email = emailController.text;

                            final String pass = pwController.text;
                            final pid = this.playerid.toString();
                            List<UserLogin> res =
                                await LoginController.login(email, pass, pid);
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('email', emailController.text);
                            prefs.setString('uRole', res[0].role);
                            prefs.setString('username', res[0].userName);
                            this.uname = res[0].userName;
                            final String username = this.uname;
                            print('user name from login ${username}');

                            role == res[0].role;
                            print(res[0].role);
                            if (email != res[0].userEmail ||
                                pass != res[0].userPassword) {
                            } else {
                              if (res[0].role == 'ADMIN') {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => homePageAdmin(
                                          this.playerid,
                                          username,
                                        )));
                              } else {
                                if (res[0].role == 'SUPPORTEXCUTIVE') {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => homePageAdmin(
                                            this.playerid,
                                            username,
                                          )));
                                } else {
                                  if (res[0].role == 'FIELDEXCUTIVE') {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => AppointmentPageFE(
                                                  this.playerid,
                                                  username,
                                                )));
                                  }
                                }
                              }
                            }
                          }
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ForgotPassword()));
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 58, 57, 57),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    )
                  ])))),
    ));
  }
}
