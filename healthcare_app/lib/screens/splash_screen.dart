

import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';

import 'screen1.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  Future<void> _navigateToMainScreen() async {
    await Future.delayed(const Duration(seconds: 3)); 
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Screen1()), 
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SingleChildScrollView(
     child:   SlideInWidget(
    child:   Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Image.asset(
                    'assets/Splash screen.png',
                  ),
            ],
        
    
      ),
    )));
  }
}
