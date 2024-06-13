


import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/res/components/constants.dart';

import '../res/components/TextFormfield.dart';
import '../res/components/app_bar.dart';
import '../res/components/round_button.dart';
import 'sign_in.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _agreementChecked = false;
  TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();

  TextEditingController nameController=TextEditingController();
 bool _obscureText = false;
 
  @override
  void dispose(){
    nameController;
    passwordController;
    emailController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final Buttonwidth=MediaQuery.of(context).size.width*0.9;
        final Buttonheight=MediaQuery.of(context).size.width*0.14;
        final newheight2=MediaQuery.of(context).size.height*0.03;
                final newheight4=MediaQuery.of(context).size.height*0.22;

             final newwidth=MediaQuery.of(context).size.width*0.03;

    return  Scaffold(
 
      body:SingleChildScrollView(
    child:    SlideInWidget(
    child:  Column(
      
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
        
         SimpleAppBar(
          backgroundColor: whiteColour,
         leadingIcon: Icons.arrow_back_ios,
         leadingIconColor: blackColour,
         leadingIconOnPressed: (){
           Navigator.pop(context); 
         },
           
           title: 'Sign Up',),
           SizedBox(
            height: newheight2,
           ),
           Padding(padding: const EdgeInsets.all(25),
         child:  Column(
            children:[
               TextFormFieldWidget(
            hintText: 'Enter your name',
            controller: nameController, 
            prefixIconData: Icons.person_outline_rounded,
            hintTextColor: newColour,
            fontFamily: 'Poppins',
            fontSize: 14,
            fillColor:fillColour ,
            borderColor: const Color(0xFFE5E7EB),
            keyboardType: TextInputType.name,
            prefixColor:iconColour,
            borderRadius: 6.0,          
           ),
           SizedBox(
            height: newheight2,
           ),
            TextFormFieldWidget(
            hintText: 'Enter your email',
            controller: emailController, 
            prefixIconData: Icons.email,
            hintTextColor: newColour,
            fontFamily: 'Poppins',
            fontSize: 14,
            fillColor: fillColour, 
            borderColor:BorderColour, 
            prefixColor:iconColour,
            keyboardType: TextInputType.emailAddress, 
             borderRadius: 6.0,
           ),
           SizedBox(
            height: newheight2,
           ),
            TextFormFieldWidget(
            hintText: 'Enter your password',
            controller: passwordController, 
            prefixIconData: Icons.lock,
            isPassword: true,
            prefixColor:iconColour,
            borderRadius: 6.0,
            
            hintTextColor: newColour,
            fontFamily: 'Poppins',
            
            
            fontSize: 14,
            fillColor: fillColour,
            obscureText: _obscureText,
         
            toggleVisibility: (isVisible) {
              setState(() {
                _obscureText = isVisible;
              });
            },
                      ),
           SizedBox(
            height: newheight2,
           ),
           Row(
            children: [
              Container(
              
            child: Row(
              children: [
                 GestureDetector(
        onTap: () {
          setState(() {
            _agreementChecked = !_agreementChecked; 
          });
        },
       child:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), 
         
          color: _agreementChecked ? BlueColour: whiteColour, 
           border: Border.all(
            color: iconColour, 
            width: 1.0,
          ),
        ),
        width: 24, 
        height: 24,
        child: _agreementChecked
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
      ),
                 ),
                 SizedBox(
                 
                  width:newwidth ,
                 ),
            
                Container(
  padding: const EdgeInsets.symmetric(horizontal: 2),
  child: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children:[
      Text(
        'I agree to the healthcare ',
        style: BlackTextStyle13,
      ),
      
    
          Text(
            'Terms of ',
            style: BlueTextStyle13,
          ),
      ]),
            Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service', 
            style:BlueTextStyle13,
          ),
           Text(
        ' and ',
        style:BlackTextStyle13,
      ),
       Text(
            'Privacy Policy',
            style: BlueTextStyle13,
          ),
    ]
      ),
    ],
  ),
),
            ])

           ),

           ]
                  
      )])),
      SizedBox(
        height: newheight4,
      ),
        Center(
        child:  RoundedButtonWidget(
             
               height: Buttonheight,
                width: Buttonwidth,
                color: BlueColour,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,   
              text: 'Sign Up', onPressed: () { 

               },
               
            )
      ),
     
       Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: BlackTextStyle14,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
          },
          child: const Text(
            "Sign In",
            style: BlueTextStyle14,
          ),
        ),
      ],
    ),

      ],

        )
      )));
  }
}
