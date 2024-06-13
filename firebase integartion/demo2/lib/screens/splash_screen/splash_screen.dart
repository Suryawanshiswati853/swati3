import 'package:demo2/screens/login_screen/login_screen.dart';
import 'package:demo2/screens/userlist/userlist.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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
      MaterialPageRoute(builder: (context) => UserListScreen()),
    );
  } else {
    // User is not logged in
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
         child: Image.asset('assets/logo2.jpeg',width: 400, height: 300,), 
      ),
    );
  }
}


