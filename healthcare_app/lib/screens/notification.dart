


import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/screens/home_screen.dart';
import 'package:healthcare_app/screens/profile_screen.dart';

import '../res/components/BottomNavigationbar.dart';
import 'Reports.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int _currentIndex = 2;

  
  @override
  Widget build(BuildContext context) {
            final newheight2=MediaQuery.of(context).size.height*0.03;
             final newheight1=MediaQuery.of(context).size.height*0.3;
    return  Scaffold(
      body:  SlideInWidget(
          delay: 200,
  child:   Column(
   
      crossAxisAlignment: CrossAxisAlignment.start,
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
        SizedBox(
          height: newheight1,
        ),
       Center(child: Image.asset('assets/Group 200.png', fit: BoxFit.cover)),

    ])),
     bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }else if(index==1){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportsScreen()),
              );

            }else if(index==2){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            }else if(index==3){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          });
  }));

    
  }
}
