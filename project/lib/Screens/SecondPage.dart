
import 'package:flutter/material.dart';
import 'package:project/Screens/FourScreen.dart';
import 'package:project/Screens/ThirdScreen.dart';
import 'package:project/Screens/mainPage.dart';
import 'package:project/components/Animation_Screen.dart/animation_screen.dart';


class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}


class _SecondScreenState extends State<SecondScreen> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
                backgroundColor: Colors.black,

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
            builder: (context) => SlideInAnimatedContainer(child: MainScreen()),
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
          decoration: TextDecoration.underline,
          decorationColor: Colors.orange,
          decorationThickness: 2.0, // Adjust the thickness as needed
        ),),
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
          ),
        ),
      ),
    ),
    IconButton(
      icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => FourScreen(),
        //   ),
       // );
      },
    ),
        ],
    
       ),
       
      
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
           
              Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                                                          
                    SizedBox(
                      height: 30,
                    ),
                     Padding(padding: EdgeInsets.only(left: 20,right: 20),

                 child:   Row(
                       children: <Widget>[
                        Container(
                        
              child:   Image.asset('assets/png/Group 1.png')), // Replace with your image path
                  ]))]))])));
  }
}                        