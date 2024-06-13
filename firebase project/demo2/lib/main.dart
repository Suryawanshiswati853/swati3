import 'package:demo2/another_app_screen/splash_page.dart';
import 'package:demo2/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   try {
  await Firebase.initializeApp(
     options:  const FirebaseOptions(
    apiKey:"AIzaSyC6RqtaDwg-FnCs_KT0aNH5kfkNxHWm2a0",
       projectId:"mydemo-19a9a",
       messagingSenderId:"383118979586",
      appId:"1:383118979586:android:dca87f242fdfb859166d1b"),            
 );
   } catch (e) {
    print("Error initializing Firebase: $e");
    return;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
     colorScheme: ColorScheme.fromSeed(seedColor: whiteColour),

        
        useMaterial3: true,
      ),
      home:  SplashPage(),
    );
  }
}

