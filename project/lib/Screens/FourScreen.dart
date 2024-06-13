
import 'package:flutter/material.dart';
import 'package:project/Screens/EleventhScreen.dart';
import 'package:project/Screens/NinethScreen.dart';
import 'package:project/Screens/mainPage.dart';
import 'package:project/components/Animation_Screen.dart/animation_screen.dart';

class FourScreen extends StatefulWidget {
  @override
  _FourScreenState createState() => _FourScreenState();
}


class _FourScreenState extends State<FourScreen> {
   int _selectedIndex = 1;
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
      MaterialPageRoute(builder: (context) =>  SlideInAnimatedContainer(child:MainScreen())),
    );       
     break;
      case 1:
        Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SlideInAnimatedContainer(child: FourScreen())),
    );    
        break;
      case 2:
      Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SlideInAnimatedContainer(child: EleventhScreen()),
              ));
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
                      height: 40,
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
    

                   ] ),

                      ],
                    ),
      ),
      const SizedBox(
        height: 10,
      ),
                    Container(
                color: Colors.black, 
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                         style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search Categories',
                          hintStyle: const TextStyle(color: Colors.white70),
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
                          ),
                         prefixIcon: const Icon(Icons.search, color: Colors.white), 

                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear, color: Colors.white),
                            onPressed: () {
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
                            Container(
                color: Colors.black, 
                  padding: const EdgeInsets.only(left: 30,right: 30),

                child: const Row(
                  children: <Widget>[
                    Icon(Icons.search, color: Colors.white),
                    SizedBox(width: 12.0),
                    Text(
                      'Top Searches',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
                            Container(
                color: Colors.black, 
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/png/S.png'),
                 
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
                                          Container(
                color: Colors.black, 
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: Row(
                  children: <Widget>[
                   Image.asset('assets/png/Groupimage.png'),
                   
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              
                                          Container(
                color: Colors.black, 
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/png/Groupimage3.png'),
                  
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              
                                          Container(
                color: Colors.black, 
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/png/Groupimage4.png'), 
               
                  
                  ],
                ),
              ),
      ]),
      
      
      
      ),
        bottomNavigationBar: BottomNavigationBar(
                selectedItemColor:Colors.black ,
                backgroundColor: Colors.orange,
              unselectedItemColor: Colors.white,
                showSelectedLabels: true,
                showUnselectedLabels: true,
        
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
      ) ;
      
      }
      }