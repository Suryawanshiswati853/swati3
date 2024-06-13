
import 'package:flutter/material.dart';
import 'package:project/Screens/SingInScreen.dart';
import 'package:project/components/Animation_Screen.dart/animation_screen.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}


class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
     Future.delayed(Duration(seconds: 3), () {
       Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SlideInAnimatedContainer(child: SignInScreen()),
              ));
    });
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 83, 86, 87),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
           
          Expanded(
            
            child: Center(
              child: Image.asset('assets/png/Group 159.jpg'
              ), 
            ),
            
          ),
          
          // Bottom 30% with khaki background
          // Container(
          //   color: Color.fromARGB(255,235,205,235),
          //              height: MediaQuery.of(context).size.height * 0.08,

          //   child: Center(
             
          //   ),
          // ),
        ],
      ),
    );
  }
}
