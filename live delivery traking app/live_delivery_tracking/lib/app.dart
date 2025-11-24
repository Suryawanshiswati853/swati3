import 'package:flutter/material.dart';
import 'ui/screens/tracking_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Delivery Tracking',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TrackingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
