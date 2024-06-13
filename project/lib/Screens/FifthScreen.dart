
import 'package:flutter/material.dart';
import 'package:project/Screens/EleventhScreen.dart';
import 'package:project/Screens/NinethScreen.dart';
import 'package:project/Screens/SixthScreen.dart';
import 'package:project/Screens/mainPage.dart';


class FiftScreen extends StatefulWidget {
  @override
  _FiftScreenState createState() => _FiftScreenState();
}


class _FiftScreenState extends State<FiftScreen> {
     int _selectedIndex = 2;
    Color _getIconColor(int index) {
    return index == _selectedIndex ? Colors.black : Colors.white;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
 Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );       
     break;
      case 1:
        Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );    
        break;
      case 2:
      Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EleventhScreen(),
              ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NinethScreen(),
              ));
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black,
      
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
           
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                                            const SizedBox(
                          height: 50,
                        ),
                   
                 

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                            InkWell(
            onTap: () {
             Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.orange,),
          ),
          InkWell(
            onTap: () {
               Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => sixthScreen()),
    );   
            },
            child: const Icon(Icons.arrow_forward_ios, color: Colors.orange,),
          ),
                      ],
                    ),
                   const SizedBox(
                    height: 30,
                   ),

Padding(padding: const EdgeInsets.only(right: 25,left: 25),
                  child:  Row(
                       children: <Widget>[
                        Container(
              child:   Image.asset('assets/png/Group 122new.png')), 
                  ])
                  
              )]),
                 
                  

                  ),
                
                  ],
                  
                  
                  

                  )),
                    bottomNavigationBar: BottomNavigationBar(
                selectedItemColor:Colors.black ,
                backgroundColor: Colors.orange,
               
                unselectedItemColor: Colors.white,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedIconTheme: const IconThemeData(color: Colors.black),
                                unselectedIconTheme: const IconThemeData(color: Colors.white),

             
                selectedFontSize: 14.0,
                iconSize: 25,
                 currentIndex: _selectedIndex,
               onTap: _onItemTapped,
              
                 type: BottomNavigationBarType.fixed,
                  unselectedFontSize: 14.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,color: _getIconColor(0)),
            label: 'Home',

          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined,color: _getIconColor(1)),
            label: 'Search',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_outlined,color: _getIconColor(2),),
            label: 'Downlods',

          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined,color: _getIconColor(3),),
            label: 'Profile',

          ),
        ],
      ),
                  
                  );
                  
  }
  
}                        