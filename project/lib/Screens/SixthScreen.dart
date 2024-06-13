import 'package:flutter/material.dart';
import 'package:project/Screens/FifthScreen.dart';
import 'package:project/Screens/FourScreen.dart';
import 'package:project/Screens/NinethScreen.dart';
import 'package:project/Screens/SecondPage.dart';
import 'package:project/Screens/SeventhScreen.dart';
import 'package:project/Screens/mainPage.dart';

class sixthScreen extends StatefulWidget {
  @override
  _sixthScreenState createState() => _sixthScreenState();
}


class _sixthScreenState extends State<sixthScreen> {
//        int _selectedIndex = 1;
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
                      
               SizedBox(height: 50,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                                                    InkWell(
            onTap: () {
             Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.orange,),
          ),
          // InkWell(
          //   onTap: () {
          //      Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => seventhScreen(),
          //     ));
          //   },
          //   child: const Icon(Icons.arrow_forward_ios, color: Colors.orange,),
          // ),
                   ] ),

                      ],
                    ),
      ),
    
                    Container(
                color: Colors.black, 
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                         style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Playlists',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.3), 
                              width: 0.9, 
                            ),

                          ),
                          focusedBorder: OutlineInputBorder(
                          
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.3), 
                              width: 0.9, 
                            ),

                            //borderSide: BorderSide.none,
                          ),
                         prefixIcon: Icon(Icons.search_outlined, color: Colors.white), // Add search icon to the left

                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear, color: Colors.white),
                            onPressed: () {

                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
                            Container(
                color: Colors.black, // Black background color
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0), 
                    Padding(padding: EdgeInsets.only(right: 15,left: 15),
                  child:   Row(
                      children: <Widget>[
                        Image.asset('assets/png/A.png'),
                        SizedBox(width: 10.0), 
                        Image.asset('assets/png/B.png'),
                        SizedBox(width: 10.0),
                        Image.asset('assets/png/C.png'),
                      ],
                    ),
                )],
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
                                          Container(
                color: Colors.black, // Black background color
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                      Padding(padding: EdgeInsets.only(right: 15,left: 15), // Add spacing between text and images
            child:  Row(
                      children: <Widget>[
                        Image.asset('assets/png/A.png'),
                        SizedBox(width: 10.0), // Add spacing between images
                        Image.asset('assets/png/B.png'),
                        SizedBox(width: 10.0),
                        Image.asset('assets/png/C.png'),
                      ],
                    ),                  )],
                ),
              ),
                                          Container(
                color: Colors.black, // Black background color
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0), 
                      Padding(padding: EdgeInsets.only(right: 15,left: 15),// Add spacing between text and images
                   child:    Row(
                      children: <Widget>[
                        Image.asset('assets/png/A.png'),
                        SizedBox(width: 10.0), // Add spacing between images
                        Image.asset('assets/png/B.png'),
                        SizedBox(width: 10.0),
                        Image.asset('assets/png/C.png'),
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
                      Padding(padding: EdgeInsets.only(right: 15,left: 15), // Add spacing between text and images
                  child:   Row(
                      children: <Widget>[
                        Image.asset('assets/png/A.png'),
                        SizedBox(width: 10.0), // Add spacing between images
                        Image.asset('assets/png/B.png'),
                        SizedBox(width: 10.0),
                        Image.asset('assets/png/C.png'),
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
                      Padding(padding: EdgeInsets.only(right: 15,left: 15),// Add spacing between text and images
              child:           Row(
                      children: <Widget>[
                        Image.asset('assets/png/A.png'),
                        SizedBox(width: 10.0), // Add spacing between images
                        Image.asset('assets/png/B.png'),
                        SizedBox(width: 10.0),
                        Image.asset('assets/png/C.png'),
                      ],
                    ),
                )],
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              
              //            Container(
                         
              //   color: Colors.black, // Black background color
              //   padding: EdgeInsets.all(8.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       SizedBox(height: 10.0), // Add spacing between text and images
              //       Row(
                      
              //         children: <Widget>[
                 
              //           Image.asset('assets/png/Group 115.png'),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
               
    //           BottomNavigationBar(
    //             backgroundColor: Colors.grey,
    //             selectedItemColor: Colors.black, // Color for selected item (icons and labels)
    // unselectedItemColor: Colors.black.withOpacity(0.5), // Color for unselected items
   
    // showSelectedLabels: true, // Display labels for selected items
    // showUnselectedLabels: true,// Background color
              
    //         items: [
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.home,color: Colors.black,),
    //             label: 'Home',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.search,color: Colors.black),
    //             label: 'Search',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.download,color: Colors.black),
    //             label: 'Downloads',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.person_rounded,color: Colors.black),
    //             label: 'User',
    //           ),
    //         ],
    //       ),




            ],
          ),
          
          

        ),
      //    bottomNavigationBar: BottomNavigationBar(
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