import 'package:flutter/material.dart';
import 'package:project/Screens/EightScreen.dart';
import 'package:project/Screens/FifthScreen.dart';
import 'package:project/Screens/FourScreen.dart';
import 'package:project/Screens/NinethScreen.dart';
import 'package:project/Screens/SecondPage.dart';
import 'package:project/Screens/SixthScreen.dart';
import 'package:project/Screens/mainPage.dart';

class seventhScreen extends StatefulWidget {
  @override
  _seventhScreenState createState() => _seventhScreenState();
}


class _seventhScreenState extends State<seventhScreen> {
  TextEditingController controller=TextEditingController();
//      int _selectedIndex = 1;
//     Color _getIconColor(int index) {
//     return index == _selectedIndex ? Colors.black : Colors.white;
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     switch (index) {
//       case 0:
//  Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => MainScreen()),
//     );       
//      break;
//       case 1:
//         Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => FourScreen()),
//     );    
//         break;
//       case 2:
//       Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => FiftScreen(),
//               ));
//         break;
//       case 3:
//         Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => NinethScreen(),
//               ));
//         break;
//     }
//   }

    @override
      Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black,
      
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
           
              Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                      
                 SizedBox(height: 60,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                                                    InkWell(
            onTap: () {
            Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.orange,),
          ),
          //   InkWell(
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => EightScreen(),
          //     ));
          //   },
          //   child: Icon(Icons.arrow_forward_ios, color: Colors.orange,),
          // ),
                   ] ),

                      ],
                    ),
      ),
    
                 Container(
                color: Colors.black, // Black background color
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        controller: controller,
                         style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Watch Later',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.3), // Faint border color
                              width: 0.9, // Faint border width
                            ),

                          //  borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.3), // Faint border color
                              width: 0.9, // Faint border width
                            ),

                            //borderSide: BorderSide.none,
                          ),
                         prefixIcon: Icon(Icons.search, color: Colors.white), // Add search icon to the left

                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear, color: Colors.white),
                            onPressed: () {
                               controller.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
     
             
                            Container(
                color: Colors.black, // Black background color
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                     Padding(padding:  EdgeInsets.only(right: 10,left: 10), // Add spacing between text and images
               child:      Row(
                      children: <Widget>[
                        Image.asset('assets/png/Rectangle 5.png'),
                        SizedBox(width: 10.0), // Add spacing between images
                        Image.asset('assets/png/Rectangleimage.png'),
                        SizedBox(width: 10.0),
                        Image.asset('assets/png/Rectanglenew.png'),
                      ],
                    ),
                )],
                ),
              ),
           
                                          Container(
                color: Colors.black, // Black background color
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                     Padding(padding:  EdgeInsets.only(right: 10,left: 10), // Add spacing between text and images
                  child:   Row(
                      children: <Widget>[
                        Image.asset('assets/png/Rectangle 5.png'),
                        SizedBox(width: 10.0), // Add spacing between images
                        Image.asset('assets/png/Rectangleimage.png'),
                        SizedBox(width: 10.0),
                        Image.asset('assets/png/Rectanglenew.png'),
                      ],
                    ),
                )],
                ),
              ),
                                          Container(
                color: Colors.black, // Black background color
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0), 
                     Padding(padding:  EdgeInsets.only(right: 10,left: 10),// Add spacing between text and images
                  child:   Row(
                      children: <Widget>[
                        Image.asset('assets/png/Rectangle 5.png'),
                        SizedBox(width: 10.0), // Add spacing between images
                        Image.asset('assets/png/Rectangleimage.png'),
                        SizedBox(width: 10.0),
                        Image.asset('assets/png/Rectanglenew.png'),
                      ],
                    ),
                )],
                ),
              ),
                                          Container(
                color: Colors.black, // Black background color
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                     Padding(padding:  EdgeInsets.only(right: 10,left: 10), // Add spacing between text and images
                  child:   Row(
                      children: <Widget>[
                        Image.asset('assets/png/Rectangle 5.png'),
                        SizedBox(width: 10.0), // Add spacing between images
                        Image.asset('assets/png/Rectangleimage.png'),
                        SizedBox(width: 10.0),
                        Image.asset('assets/png/Rectanglenew.png'),
                      ],
                    ),
                )],
                ),
              ),
                                          Container(
                color: Colors.black, // Black background color
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                     Padding(padding:  EdgeInsets.only(right: 10,left: 10), // Add spacing between text and images
                  child:   Row(
                      children: <Widget>[
                   Image.asset('assets/png/Rectangle 5.png'),
                        SizedBox(width: 10.0), // Add spacing between images
                        Image.asset('assets/png/Rectangleimage.png'),
                        SizedBox(width: 10.0),
                        Image.asset('assets/png/Rectanglenew.png'),
                      ],
                    ),
                )],
                ),
              ),

                

            ],
          ),
          
          
          

        ),
      //     bottomNavigationBar: BottomNavigationBar(
      //           selectedItemColor:Colors.black ,
      //           backgroundColor: Colors.orange,
      //         unselectedItemColor: Colors.white,
      //           showSelectedLabels: true,
      //           showUnselectedLabels: true,
        
      //           selectedFontSize: 14.0,
      //           iconSize: 25,
      //            currentIndex: _selectedIndex,
      //          onTap: _onItemTapped,
              
      //            type: BottomNavigationBarType.fixed,
      //             unselectedFontSize: 14.0,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined,color: _getIconColor(0)),
      //       label: 'Home',

          
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search_outlined,color: _getIconColor(1)),
      //       label: 'Search',

      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.download_outlined,color: _getIconColor(2),),
      //       label: 'Downlods',

      //     ),
      //      BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline_outlined,color: _getIconColor(3),),
      //       label: 'Users',

      //     ),
      //   ],
      // ),
        
        );
      }
}