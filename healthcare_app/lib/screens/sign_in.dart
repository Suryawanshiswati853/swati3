
import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/res/components/constants.dart';
import 'package:healthcare_app/screens/sign_up.dart';
// import 'package:google_sign_in/google_sign_in.dart';

import '../res/components/TextFormfield.dart';
import '../res/components/app_bar.dart';
import '../res/components/round_button.dart';
// import 'package:twitter_login/twitter_login.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
     final String apiKey = 'cII6IygjHBYH1rWzhVKaqOnps';
  final String apiSecretKey = 'yQS6iKBlPwEZaAo36TvnwRGNdILcir9ut90GnQooRDv7yQkSpm';
  TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();

  TextEditingController nameController=TextEditingController();
 bool _obscureText = false;
 // sign with google
//  void googleLogin() async {
//   print('sign in with google');
//   GoogleSignIn _googleSignIn = GoogleSignIn();
//   try {
//     var result = await _googleSignIn.signIn();
//     if (result != null) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return  AlertDialog(
//             title: const Text('User Information',style:BlackTextStyle18Bold),
//             content: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text('Name: ${result.displayName ?? "N/A"}'),
//                 Text('Email: ${result.email ?? "N/A"}'),
//                 result.photoUrl != null
//                     ? Image.network(result.photoUrl!)
//                     : const Text('Photo: N/A'),
//               ],
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('Close'),
//               ),
//             ],
//           );
//         },
//       );
//     } else {
//       print('User canceled sign in.');
//     }
//   } catch (e) {
//     // Handle error
//     print('Error signing in with Google: $e');
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Error'),
//           content: const Text('An error occurred while signing in with Google.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
// login with facebook
// facebookLogin() async {
//     print("FaceBook");
//     try {
//       final result = await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
//       if (result.status == LoginStatus.success) {
//         final userData = await FacebookAuth.i.getUserData();
//         print(userData);
//         showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("User Data",style: BlackTextStyle16withBold,),
//             content: Text(userData.toString()),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text('Close'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
    
//     } catch (error) {
//      showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("Error"),
//           content: Text(error.toString()),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Close'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//     }
  

    

 
  @override
  void dispose(){
   nameController;
  passwordController;
  emailController;
  super.dispose();
 
 }
  @override
  Widget build(BuildContext context) {
        final Buttonwidth=MediaQuery.of(context).size.width*0.8;
       final Buttonheight=MediaQuery.of(context).size.width*0.14;
      final newheight2=MediaQuery.of(context).size.height*0.03;
    final newwidth=MediaQuery.of(context).size.width*0.08;
    return  Scaffold(
     
      body:SingleChildScrollView(
        child:SlideInWidget(
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
           
           title: 'Sign In',),
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
            borderColor: GreyColour,
            keyboardType: TextInputType.name,
            prefixColor:iconColour,
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
            
            hintTextColor: newColour,
            fontFamily: 'Poppins',
            borderRadius: 6.0,
            fontSize: 14,
            fillColor: fillColour,
            borderColor: GreyColour,
            obscureText: _obscureText,
         
            toggleVisibility: (isVisible) {
              setState(() {
                _obscureText = isVisible;
              });
            },
                      ),
                       const SizedBox(
            height: 3,
           ),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
          onPressed: () {
               },
          child: const Text(
            "Forgot Password?",
            style: BlueTextStyle13,
          ),
        ),
            ],
           ),
           SizedBox(
            height: newwidth,
           ),
          
   
        Center(
        child:  RoundedButtonWidget(
             
               height: Buttonheight,
                width: Buttonwidth,
                color: BlueColour,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,   
              text: 'Sign In', onPressed: () { 

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
       Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));

          },
          child: const Text(
            "Sign Up",
            style: BlueTextStyle14,
          ),
        ),
      ],
    ),
    SizedBox(
      width: newwidth,
    ),

     const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'OR',
            style: GreyTextStyle16,
          ),
        ),
        Expanded(child: Divider(thickness: 1)),
      ],
    ),
    const SizedBox(
      height: 30,
    ),
    InkWell(
     // onTap: googleLogin,
  
      
  child:Column(children: [
      Container(
  padding:  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8), 
    border: Border.all(color: GreyColour), 
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.asset(
        'assets/Google.png',
        height: 28, 
      ),
       const SizedBox(width: 8), 
       const Text(
        'Sign in with Google',
       style: TextStyle(fontSize: 16,fontFamily: 'Poppins',color: blackColour,fontWeight: FontWeight.bold),

      ),
    ],
  ),
),
           
const SizedBox(
  height: 10,
),
InkWell(
 // onTap:facebookLogin,
  child: Container(
  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), 
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8), 
    border: Border.all(color: GreyColour), 
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.asset(
        'assets/Facebook.png',
        height: 28, 
      ),
      const SizedBox(width: 10), 
      const Text(
        'Sign in with Facebook',
        style: TextStyle(fontSize: 16,fontFamily: 'Poppins',color: blackColour,fontWeight: FontWeight.bold),
      ),
    ],
  ),
)

   
    )],),
    ),
    const SizedBox(
  height: 10,
),
     InkWell(
      onTap: (){
      //  login(context);
      },
       child: Container(
         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), 
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(8), 
           border: Border.all(color: GreyColour), 
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
        Image.asset(
          'assets/download 4.png',
          height: 28,
          width: 20, 
        ),
        const SizedBox(width: 10), 
        const Text(
          'Sign in with Twitter',
          style: TextStyle(fontSize: 16,fontFamily: 'Poppins',color: blackColour,fontWeight: FontWeight.bold),
        ),
           ],
         ),
       ),
     )

   
    ],
       ),
        
      )]
      )
      )
      ));
  }
//   Future<void> login(BuildContext context) async {
//   try {
//     final twitterLogin = TwitterLogin(
//       apiKey: apiKey,
//       apiSecretKey: apiSecretKey,
//       redirectURI: 'https://twitter.com/home',
//     );
//     final authResult = await twitterLogin.login();
//     switch (authResult.status) {
//       case TwitterLoginStatus.loggedIn:
//         // success
       
      
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('User Information'),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('User ID: ${authResult.user!.id}'),
//                   Text('Screen Name: ${authResult.user!.screenName}'),
//                  Text('Name: ${authResult.user!.name}'),
//                 Text('Screen Name: ${authResult.user!.thumbnailImage}'),


//                ],
//              ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('Close'),
//                 ),
//               ],
//            );
//           },
//        );
//         break;
//       case TwitterLoginStatus.cancelledByUser:
//         // cancel
//         print('====== Login cancel ======');
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Login Cancelled'),
//               content: const Text('The login process was cancelled by the user.'),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text('Close'),
//                 ),
//               ],
//             );
//           },
//         );
//         break;
//       case TwitterLoginStatus.error:
//       case null:
//         // error
//         print('====== Login error ======');
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Login Error'),
//               content: const Text('An error occurred during the login process.'),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text('Close'),
//                 ),
//               ],
//             );
//           },
//         );
//         break;
//     }
//   } catch (e) {
//     // Exception
//     print('====== Exception ======');
//     print(e.toString());
//   }
// }
}


