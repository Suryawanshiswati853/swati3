import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Color iconColor;
  final double iconSize;
  final double labelFontSize;
  final FontWeight labelFontWeight;
  final Color labelColor;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
   this.iconColor = BlueColour, 
    this.iconSize = 24, 
    this.labelFontSize = 12, 
    this.labelFontWeight = FontWeight.normal, 
    this.labelColor = const Color.fromRGBO(34, 31, 31, 0.6),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2), 
          ),
        ],
      ),
   child:  BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: iconColor, 
      unselectedItemColor: const Color.fromRGBO(34, 31, 31, 0.6), 
      iconSize: iconSize,
      selectedFontSize: labelFontSize,
      unselectedFontSize: labelFontSize,
      selectedLabelStyle: TextStyle(
        fontWeight: labelFontWeight,
        color: iconColor,
        
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: labelFontWeight,
        color: newColour2
      ),
      items:  [
         BottomNavigationBarItem(
          icon: currentIndex==0? Image.asset('assets/Home2.png',): Image.asset('assets/Home.png',),
                //  icon: currentIndex == 0 ?  Icon(Icons.home,color: iconColor,):const Icon(Icons.home_outlined),

          label: 'Home',
        ),
        BottomNavigationBarItem(
     icon: currentIndex == 1 ? Image.asset('assets/Frame6.png',) :  Image.asset('assets/Frame 5.png',) , 
          label: 'Reports',
        ),
        BottomNavigationBarItem(
               icon: currentIndex == 2 ? Image.asset('assets/notification2.png',) :  Image.asset('assets/notification.png',) , 

        //  icon: currentIndex == 2 ?  Icon(Icons.notifications,color: iconColor,):const Icon(Icons.notifications_outlined),
          label: 'Notifications',
        ),
         BottomNavigationBarItem(
             icon: currentIndex == 3 ? Image.asset('assets/Profile.png',) :  Image.asset('assets/Profile2.png',) , 

       // icon: currentIndex == 3 ?  Icon(Icons.person,color: iconColor,):const Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    ));
  }
}
