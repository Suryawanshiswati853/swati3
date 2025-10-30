import 'package:flutter/material.dart';
import 'package:my_new_app/utils/Colors.dart';
import 'package:my_new_app/screens/home_screen.dart';

void main() {
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
    brightness: Brightness.light,
    primaryColor: TColors.primary, 
    appBarTheme: const AppBarTheme(
      backgroundColor: TColors.primary, // light background
      foregroundColor: Colors.white, // light text & icon color
    ),
  ),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E), // dark background
      foregroundColor: Colors.white70,    
    ),
  ),
  themeMode: ThemeMode.system, 
      home:  HabitTrackerHome(),
    );
  }
}

