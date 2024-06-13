import 'package:flutter/material.dart';
import 'package:project/Screens/EightScreen.dart';
import 'package:project/Screens/EleventhScreen.dart';
import 'package:project/Screens/FifthScreen.dart';
import 'package:project/Screens/FourScreen.dart';
import 'package:project/Screens/NinethScreen.dart';
import 'package:project/Screens/SecondPage.dart';
import 'package:project/Screens/SeventhScreen.dart';
import 'package:project/Screens/SixthScreen.dart';
import 'package:project/Screens/TenthScreen.dart';
import 'package:project/Screens/ThirdScreen.dart';
import 'package:project/Screens/TwelveScreen.dart';
import 'package:project/components/Animation_Screen.dart/animation_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  void handleMenuItemPressed(String value) {
    print('Pressed: $value');
  }
    int _selectedIndex = 0;
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
      MaterialPageRoute(builder: (context) => SlideInAnimatedContainer(child: MainScreen())),
    );       
     break;
      case 1:
        Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  SlideInAnimatedContainer(child:FourScreen())),
    );    
        break;
      case 2:
       Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SlideInAnimatedContainer(child: EleventhScreen())),
    );    
        break;
      case 3:
       Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SlideInAnimatedContainer(child: NinethScreen()),
              ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Builder(
    builder: (context) => IconButton(
      icon: const Icon(Icons.menu, color: Colors.white),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    ),
  ),
    actions: [
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            decorationColor: Colors.orange,
            decorationThickness: 2.0,
          ),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'All Videos',
          style: TextStyle(
            color: Colors.white,
            decorationThickness: 2.0,
          ),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThirdScreen(),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'Topics',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
    IconButton(
      icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
      onPressed: () {
       
      },
    ),
        ],
      
        ),
      


            drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
                  Container(
                 color: const Color.fromARGB(115, 31, 29, 29),

              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/png/avatar 7.jpg'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Aranya Prakash Mahapatra', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(padding: EdgeInsets.only(right: 10,left: 10),
           child: Divider(color: Colors.white,height: 1,thickness: 2,),
           ) ,
                //  const SizedBox(height: 5),
        //                 Container(
        // decoration: const BoxDecoration(
        //   border: Border(
        //     bottom: BorderSide(
        //       color: Colors.white,
        //       width: 2.0,
        //     ),
        //   ),
        // ), 
              
         
        //       )],
          ]),
            ),
            Column(
  children: [
          //   ListTile(
          //     leading: const Icon(Icons.person_outline_outlined,color:Colors.white),
          //     title: const Text('Profile',
          //                         style: TextStyle( color: Colors.white),
          //              ),
          //     onTap: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => NinethScreen(),
          //     ));

          //     },
          //   ),
          //  Padding(padding: EdgeInsets.only(right: 40,left: 20),
          //  child: Divider(color: Colors.white,height: 1,thickness: 1,),
          //  ) ,
          //   ListTile(
          //     leading: const Icon(Icons.download_outlined,color:Colors.white
          //     ),
          //     title: const Text('Downloads',
          //     style: TextStyle( color: Colors.white
          // ),
          //     ),
          //     onTap: () {
          //        Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => EleventhScreen(),
          //     ));
          // //      Padding(padding: EdgeInsets.only(right: 10,left: 10),
          // //  child: Divider(color: Colors.white,height: 1,thickness: 1,),
          // //  );
                

          //     },
          //   ),
          //    Padding(padding: EdgeInsets.only(right: 40,left: 20),
          //  child: Divider(color: Colors.white,height: 1,thickness: 1,),
          //  ) ,
                        ListTile(
              leading: const Icon(Icons.settings_outlined,color:Colors.white),
              title: const Text(' App Settings',
               style: TextStyle( color: Colors.white
          ),),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SlideInAnimatedContainer(
              child:  TenthScreen()),
              ));
              },
            ),
             const Padding(padding: EdgeInsets.only(right: 40,left: 20),
           child: Divider(color: Colors.white,height: 1,thickness: 1,),
           ) ,
            ListTile(
              leading: const Icon(Icons.featured_play_list_outlined,color:Colors.white),
              title: const Text('Playlist', style: TextStyle( color: Colors.white
          ),),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SlideInAnimatedContainer(child:  sixthScreen()),
              ));
                
              },
            ),
             const Padding(padding: EdgeInsets.only(right: 40,left: 20),
           child: Divider(color: Colors.white,height: 1,thickness: 1,),
           ) ,
            ListTile(
              leading: const Icon(Icons.watch_later_outlined,color:Colors.white),
              title: const Text('Watch Later', style: TextStyle( color: Colors.white
          ),),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SlideInAnimatedContainer(child: seventhScreen()),
              ));
                
              },
            ),
             const Padding(padding: EdgeInsets.only(right: 40,left: 20),
           child: Divider(color: Colors.white,height: 1,thickness: 1,),
           ) ,
            ListTile(
              leading: const Icon(Icons.payment_outlined,color:Colors.white),
              title: const Text('Payment', style: TextStyle( color: Colors.white
          ),),
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SlideInAnimatedContainer(child: EightScreen()),
              ));
                
              },
            ),
             const Padding(padding: EdgeInsets.only(right: 40,left: 20),
           child: Divider(color: Colors.white,height: 1,thickness: 1,),
           ) ,
            ListTile(
              leading: const Icon(Icons.subscriptions_outlined,color:Colors.white),
              title: const Text('Subscription', style: TextStyle( color: Colors.white
          ),),
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SlideInAnimatedContainer(child: TwelveScreen()),
                 ));
                
                
              },
            ),
             const Padding(padding: EdgeInsets.only(right: 40,left: 20),
           child: Divider(color: Colors.white,height: 1,thickness: 1,),
           ) ,
  //         //   ListTile(
  //         //     leading: const Icon(Icons.details_outlined,color:Colors.white),
  //         //     title: const Text('Pan card details', style: TextStyle( color: Colors.white
  //         // ),),
  //         //     onTap: () async {  
  //         //        Navigator.of(context).push(MaterialPageRoute(
  //         //       builder: (context) => RegistrationPage2(),
  //         //        ));        
  //         //       }),
  // Padding(padding: EdgeInsets.only(right: 40,left: 20),
  //          child: Divider(color: Colors.white,height: 1,thickness: 1,),
  //          ) ,
           
          
                
        
            ListTile(
              leading: const Icon(Icons.logout,color:Colors.white),
              title: const Text('Logout', style: TextStyle( color: Colors.white
          ),),
              onTap: () async {          
  }),
   const Padding(padding: EdgeInsets.only(right: 40,left: 20),
           child: Divider(color: Colors.white,height: 1,thickness: 1,),
           ) ,
  ],
        ),
      ]),
            ),
        backgroundColor: Colors.black,
      
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
           
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: <Widget>[
                     
                   
                 Padding(padding: const EdgeInsets.only(right: 20,left: 10),
                  child:   Row(
                       children: <Widget>[
                 Image.asset('assets/png/slider (4).png'), 
                  ])),
                                      const SizedBox(
                      height: 5,
                    ),
                                Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text('Continue Watching', style: TextStyle(color: Colors.white)),
                    ),


                    const Spacer(),

                    const Text('See All',style: TextStyle(
                      color: Colors.white54
                    ),),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
                                  Row(
                       children: <Widget>[
  Container(
   
    child: Image.asset(
      'assets/png/Rectangle 3.png',
       fit: BoxFit.fill
     
    ),
  ),
  const SizedBox(
    width:10 ,
  ),


                        Container(
     
      child: Image.asset('assets/png/Rectangle 4.jpg',
      fit: BoxFit.contain),
      
     ),

                        
                
   
                  ]),


                   
             const Divider(),

              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text('Top Watches', style: TextStyle(color: Colors.white)),
                    ),
                    const Text('See All',style: TextStyle(color: Colors.white54)),
                  ],
                ),
              ),
                                                Row(
                       children: <Widget>[
  Container(
    width: 300,
    height:100,
    child: Image.asset(
      'assets/png/Frame 1.png',
       fit: BoxFit.fill
     
    ),
  )]),

  const Divider(),

                            Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text('Video List', style: TextStyle(color: Colors.white)),
                    ),
                    const Text('See All',style: TextStyle(color: Colors.white54)),
                  ],
                ),
              ),
                                                              Row(
                       children: <Widget>[
  Container(
    // width: 210,
    // height:180,
    child: Image.asset(
      'assets/png/Frame 2.png',
       fit: BoxFit.fill
     
    ),
  )]),
  const Divider(),
                              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text('Watchlist', style: TextStyle(color: Colors.white)),
                    ),
                    const Text('See All',style: TextStyle(color: Colors.white54)),
                  ],
                ),
              ),
                 Row(
                                     children: <Widget>[
  Container(
  
    child: Image.asset(
      'assets/png/Frame 3.png',
       fit: BoxFit.fill
     
    ),
  )]),
  const Divider(),
                              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text('Playlist', style: TextStyle(color: Colors.white)),
                    ),
                    const Text('See All',style: TextStyle(color: Colors.white54)),
                  ],
                ),
              ),
                 Row(
                                     children: <Widget>[
  Container(
    // width: 210,
    // height:180,
    child: Image.asset(
      'assets/png/Frame 3.png',
       fit: BoxFit.fill
     
    ),
  )]),
  const Divider(),
                              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text('Category', style: TextStyle(color: Colors.white)),
                    ),
                    const Text('See All',style: TextStyle(color: Colors.white54)),
                  ],
                ),
              ),
                 Row(
                                     children: <Widget>[
  Container(
    // width: 210,
    // height:180,
    child: Image.asset(
      'assets/png/category.png',
       fit: BoxFit.fill
     
    ),
  )]),
  const Divider(),
                              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text('Topic', style: TextStyle(color: Colors.white)),
                    ),
                    const Text('See All',style: TextStyle(color: Colors.white54)),
                  ],
                ),
              ),
                 Row(
                                     children: <Widget>[
  Container(
    // width: 210,
    // height:180,
    child: Image.asset(
      'assets/png/Topic.png',
       fit: BoxFit.fill
     
    ),
  )]
  ),
  
                ],
  
  
              
              



          
          //],
          ),
          
          
        )
        ]),
        
        
        ),
               bottomNavigationBar: BottomNavigationBar(
                selectedItemColor:Colors.black ,
                backgroundColor: Colors.orange,
               
               // backgroundColor: const Color.fromARGB(255, 97, 116, 150),
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
        ),
        
    );
  }
}
