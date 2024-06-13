
import 'package:flutter/material.dart';
import 'package:project/Screens/FourScreen.dart';
import 'package:project/Screens/SecondPage.dart';
import 'package:project/Screens/mainPage.dart';
import 'package:project/components/Animation_Screen.dart/animation_screen.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}


class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
           leading:  IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.orange),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  
    actions: [
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          
          ),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SlideInAnimatedContainer(child: SecondScreen()),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'All Videos',
            style: TextStyle(
            color: Colors.white,
          )),
        //       style: TextStyle(
        //    color: Colors.white,
        //   decoration: TextDecoration.underline,
        //   decorationColor: Colors.orange,
        //   decorationThickness: 2.0, // Adjust the thickness as needed
        // ),),
        ),
      ),
    
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThirdScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'Topics',
              style: TextStyle(
           color: Colors.white,
          decoration: TextDecoration.underline,
          decorationColor: Colors.orange,
          decorationThickness: 2.0, // Adjust the thickness as needed
        ),),
        ),
      ),
    
    IconButton(
      icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
      onPressed: () {
       
      },
    ),
        ],
    
       ),
        backgroundColor: Colors.black,
      
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
           
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                                            const SizedBox(
                          height: 30,
                        ),
                    Padding(padding: const EdgeInsets.only(right: 25,left: 25),

                 child:    Row(
                       children: <Widget>[
                      
                       
                 Image.asset('assets/png/Group 117.png'), 
                 const SizedBox(
                  width: 10,
                 ),
                    Image.asset('assets/png/Group 118 (1).png'), 
                  ]),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                   Padding(padding: const EdgeInsets.only(right: 25,left: 25),
                                   child:    Row(
                       children: <Widget>[
                      
                       
                 Image.asset('assets/png/Group 120 (1).png'), 
                 const SizedBox(
                  width: 5,
                 ),
                    Image.asset('assets/png/Group 119 (1).png'), 
                  ])
                 ) ]))])));
  }
}                        