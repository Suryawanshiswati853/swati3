import 'package:flutter/material.dart';
import 'package:project/Screens/SplaceScreen.dart';
import 'package:project/Screens/SqliteExample.dart';
import 'package:project/Screens/ThirdScreen.dart';
import 'package:project/Screens/mainPage.dart';



void main()  {
     WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demo",
     home: MyScreen(),

     
    );
  }
}