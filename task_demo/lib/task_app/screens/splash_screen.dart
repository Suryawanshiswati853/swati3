import 'package:flutter/material.dart';
import 'package:task_demo/components/constants.dart';
import 'package:task_demo/task_app/screens/to_do_list.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _checkAuthStatus(context);
  }
  void _checkAuthStatus(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => TodoListScreen()),
    );

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: backgroundColor,

      body: Center(
         child:SpinKitFadingCircle(
  itemBuilder: (_, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
         )
      ),
    );
  }
}

