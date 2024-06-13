

import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/res/components/constants.dart';
import 'package:healthcare_app/screens/checkout.dart';
import 'package:healthcare_app/screens/doctor_details.dart';
import 'package:healthcare_app/screens/screen3.dart';
import 'package:healthcare_app/screens/splash_screen.dart';
import 'package:healthcare_app/screens/top_doctors.dart';

import '../res/components/BottomNavigationbar.dart';
import 'Reports.dart';
import 'home_screen.dart';
import 'notification.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex=3;
 
  @override
  Widget build(BuildContext context) {
   final newheight2=MediaQuery.of(context).size.height*0.03;
   final newheight1=MediaQuery.of(context).size.height*0.050;
    return  Scaffold(
      body:SingleChildScrollView(
         child:SlideInWidget(
          delay: 200,
   child:    Column(
   
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
        const Center(
       child:  CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/Ellipsenew.png'),
                        ),
                        
                     
   ),
    const SizedBox(
      height: 10,
    ),
    const Center(
      child: Text(
        'Ruchita',
        style: BlackTextStyle12withBold
   )),
 
    Padding(padding: const EdgeInsets.only(right: 20,left: 20),
 child:  Row(
    children: [
      Column(
        children: [
          Padding(padding: const EdgeInsets.only(right: 10,left: 20),
        child:  Image.asset('assets/Vector.png',height: 50,width: 50,)),
         
           const Padding(padding: EdgeInsets.only(right: 10,left: 20),
        child:  Text('Heart rate',style: BlueTextStyle10,)),
        const SizedBox(
          height: 5,
        ),
         
          const Padding(padding: EdgeInsets.only(right: 10,left: 20),
        child:  Text('215bpm',style: BlueTextStyle16,)),

        ],
      ),
    
       Column(
        children: [
          Padding(padding: const EdgeInsets.only(right: 10,left: 20),
        child:  Image.asset('assets/Fire.png',height: 50,width: 50,)),
         
           const Padding(padding: EdgeInsets.only(right: 10,left: 20),
        child:  Text('Calories',style: BlueTextStyle10,)),
          const SizedBox(
          height: 5,
        ),
          
         
          const Padding(padding: EdgeInsets.only(right: 10,left: 20),
        child:  Text('756cal',style: BlueTextStyle16,)),

        ],
      ),
    
       Column(
        children: [
          Padding(padding: const EdgeInsets.only(right: 10,left: 20),
        child:  Image.asset('assets/Vector2.png',height: 50,width: 50,)),
         
           const Padding(padding: EdgeInsets.only(right: 10,left: 20),
        child:  Text('Weight',style: BlueTextStyle10,)),
           const SizedBox(
          height: 5,
        ),
         
          const Padding(padding: EdgeInsets.only(right: 10,left: 20),
        child:  Text('103lbs',style: BlueTextStyle16,)),

        ],
      )
    ],
   ),
   
  ) ,
           buildSettingCard('assets/Group 49.png', 'My Saved', whiteColour, () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  },),
          buildSettingCard('assets/Group 106.png', 'Appointment', whiteColour, () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DoctorDetails()),
    );
  },),
          buildSettingCard('assets/Group 107.png', 'Payment Method', whiteColour, () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckOut()),
    );
  },),
           buildSettingCard('assets/Group 108.png', 'FAQs', whiteColour,
            () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TopDoctorsScreen()),
    );
  },),        
          buildSettingCard('assets/Group 109.png', 'Logout', whiteColour, () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Screen3()),
    );
  },),        


  ] ),
      )),
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
Widget buildSettingCard(String imagePath, String title, Color backgroundColor, VoidCallback onTap,) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
    child: ListTile(
      
      tileColor: backgroundColor,
      
      leading: Image.asset(imagePath),
      title: Row(
        children: [
          Text(
            title,
            style: BlackTextStyle14Bold,
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color:newColour2, size: 20),
        ],
      ),
      onTap:  onTap,
    ),
  );
}

