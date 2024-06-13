import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/res/components/constants.dart';
import 'package:healthcare_app/screens/sign_up.dart';

import '../res/components/round_button.dart';
import 'home_screen.dart';


class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  

  @override
  Widget build(BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final height=MediaQuery.of(context).size.height*0.002;
        final newheight2=MediaQuery.of(context).size.height*0.03;
        final newheight3=MediaQuery.of(context).size.height*0.10;
    final imagewidth=screenWidth * 118 / 414;
    final Imageheight=screenHeight * 105 / 896;

    return  Scaffold(
      body:SingleChildScrollView(
         child: SlideInWidget(
          delay: 200,
     child:   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(
                height: newheight2,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10,left: 10),
                child: Transform.translate(
                  offset: const Offset(14.0, 6.0),
                  child: Image.asset('assets/Frame 2.png',
                      fit: BoxFit.cover),
                ),
              ),
         SizedBox(
          height: newheight3,
        ),
        SizedBox(
          height: newheight3,
        ),
         Center(
      child:  Image.asset('assets/Group 212.png',width: imagewidth,height: Imageheight,)),
       SizedBox(
          height: height,
        ),
           const Center(
       child:  Text(
                  'Let’s get started!',
                  style: TextStyle22
                ),
              
            ),
             const Center(
       child:  Text(
                  'Login to Stay healthy and fit',
                  style: TextStyle14
                ),
                
              
            ),
            SizedBox(
              height: newheight3,
            ),
            Center(
        child:  RoundedButtonWidget(
             
               height: MediaQuery.of(context).size.width*0.14,
                width: 250,
                color: BlueColour,
                
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
              
                
              text: 'Login', onPressed: () { 
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));

               },
               
            )
      ),
      SizedBox(height: newheight2,),
        Center(
        child:  RoundedButtonWidget(
             
               height: 56,
                width: 250,
                
                color: ButtonColour,
                borderColor: BlueColour,
                
                
                fontFamily: 'Inter',
              
                fontWeight: FontWeight.normal,
                
              text: 'Sign up', onPressed: () { 
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));


               },
                 textStyle: const TextStyle(
                color: BlueColour,
                 fontFamily: 'Inter',
                 fontSize: 16
               
  ),
            ))
      ]))));
  }
}