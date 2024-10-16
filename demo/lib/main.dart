import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_demo/components/constants.dart';
import 'package:task_demo/newapp/screens/login_screen.dart';


    void main()async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
     await Firebase.initializeApp(
     options:  const FirebaseOptions(
     apiKey:"AIzaSyAykVVtVLIWDNRMRSVIrSPjOj-IOAMdX2Q",
     projectId:"taskdemo-c4f32",
     messagingSenderId:"60293798240",
     appId:"1:60293798240:android:57123d84dc8da779486605"),            
     );
     } catch (e) {
      print("Error initializing Firebase: $e");
      return;
      }
     runApp( MyApp(),
    );
  
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
      home:MyLoginPage(),
    );
  }
}

