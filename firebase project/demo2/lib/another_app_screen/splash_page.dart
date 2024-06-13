import 'package:demo2/another_app_screen/login_page.dart';
import 'package:demo2/another_app_screen/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _checkAuthStatus(context);
  }
  void _checkAuthStatus(BuildContext context) async {
  await Future.delayed(Duration(seconds: 2));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  if (isLoggedIn) {
    // User is logged in
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => UserListPage()),
    );
  } else {
    // User is not logged in
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: const Color.fromARGB(255, 83, 86, 87),

      body: Center(
         child:SpinKitFadingCircle(
  itemBuilder: (_, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
         )
      ),
    );
  }
}

