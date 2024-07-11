import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_demo/components/constants.dart';
import 'package:task_demo/task_app/screens/splash_screen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   
   try {
  await Firebase.initializeApp(
     options:  const FirebaseOptions(
    apiKey:"",
       projectId:"",
       messagingSenderId:"",
      appId:""),            
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

