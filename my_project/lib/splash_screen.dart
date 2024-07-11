import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_project/camera_screen.dart';


class splashPage extends StatefulWidget {
  @override
  _splashPageState createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {

  @override
  void initState() {
    super.initState();
    _checkAuthStatus(context);
  }
  void _checkAuthStatus(BuildContext context) async {
  await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => CameraScreen()),
    );

  
   
   
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           // backgroundColor: const Color.fromARGB(255, 83, 86, 87),

      body: Center(
         child:SpinKitFadingCube(
          color: Colors.deepPurple,
          size: 50.0,
        //   itemBuilder: (_, int index) {
        //   return DecoratedBox(
        //   decoration: BoxDecoration(
        //     color: Colors.deepPurple
        //  // color: index.isEven ? Colors.deepPurple : Colors.pinkAccent,
        //   ),
        // );
      // },
         )
      ),
    );
  }
}

