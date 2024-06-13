
import 'package:flutter/material.dart';
import 'package:project/Screens/FourScreen.dart';
import 'package:project/Screens/NinethScreen.dart';
import 'package:project/Screens/SixthScreen.dart';
import 'package:project/Screens/mainPage.dart';
import 'package:project/components/Animation_Screen.dart/animation_screen.dart';


class EleventhScreen extends StatefulWidget {
  @override
  _EleventhScreenState createState() => _EleventhScreenState();
}


class _EleventhScreenState extends State<EleventhScreen> {
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
      MaterialPageRoute(builder: (context) => SlideInAnimatedContainer(child: MainScreen())),
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
                        

                          const SizedBox(width: 20.0),
          
                         



                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(padding: const EdgeInsets.only(right: 15,left: 15),

                  child:   Row(
                       children: <Widget>[
                        Image.asset('assets/png/slider1.png'), 
                  ]),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                    const Center(
                      child: Column(
                        children: [
                          Text(
                            "All Is Well",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "New episodes",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      
                  
              ),
              const SizedBox(
                height:12
              ),
              Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 150,
                     child:   ElevatedButton(
                          onPressed: () {
              
                          },
                          style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: Colors.orange // Adjust padding as needed
                ),
                                 child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.play_arrow,color: Colors.black,), // Icon
                    SizedBox(width: 8.0),
                       
                           Text("Play",
                                               style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                    ),),
                      ]),
                        ),
                        ),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                             //FourScreen
                              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FourScreen(),
              ));

                          },
                          
                          style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: Colors.white // Adjust padding as needed
                ),
                 child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.download_sharp,color: Colors.black,), // Icon
                    SizedBox(width: 8.0),
                            Text("Download S1:E3",
                                                style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      
                    ),),
                      ]),
              )
              ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                     Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    const Padding(
      padding: EdgeInsets.only(right: 5,left: 5), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
           Icon(Icons.add_circle_outline_outlined, color: Colors.white), // Icon 1
          SizedBox(height: 4.0), 
          Text(
            'Wishlist',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ), // Text 1
        ],
      ),
      
    ),
    const Padding(
        padding: EdgeInsets.only(right: 5,left: 5), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
          Icon(Icons.share, color: Colors.white), // Icon 2
          SizedBox(height: 4.0), 
          Text(
            'Share',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ), // Text 2
        ],
      ),
    ),
    InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => sixthScreen(),
              ));
      },
      child: const Padding(
          padding: EdgeInsets.only(right: 5,left: 5), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Icon(Icons.featured_play_list_outlined, color: Colors.white), // Icon 3
            SizedBox(height: 4.0), 
            Text(
              'Playlist',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ), // Text 3
          ],
        ),
      ),
    ),
  ],
),
  const SizedBox(
                      height: 15,
                    ),
                    
                                             Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    const Padding(
      padding: EdgeInsets.all(4.0), 
                                child:   Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet,consectetur adipiscing elit.Lobortis enim faucibus donec',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                      ),
                    ],
                  ),
   ] ),
    ),
                                                 Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    const Padding(
      padding: EdgeInsets.all(4.0), 
          child:        Row(
                     mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      
                      Text(
                        'semper tempor.In ut velit,ornare vel iaculis dignissim.In sodales elementum augue',
                        textAlign: TextAlign.center,
                                 style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                      ),
                    ],
                  ),
    ),
    Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    const Padding(
      padding: EdgeInsets.all(4.0), 
          child:        Row(
                     mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      
                      Text(
                        'eget in nunc arcu pharetra.Nisl proin tempor amet sed proin praesent luctus.Felis eros,',
                        textAlign: TextAlign.center,
                                 style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                      ),
                    ],
                  ),
    ),
        const Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Padding(
      padding: EdgeInsets.all(4.0), 
          child:        Row(
                     mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      
                      Text(
                        'commodo ac etiam vel suspendisse habitant.this text in fourth row',
                        textAlign: TextAlign.center,
                                 style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                      ),
                    ],
                  ),
    ),

    

    
  

              ]),
              const SizedBox(
                height: 10,
              ),
              Container(
      height: 2,
      color: Colors.grey, 
      width: double.infinity,
    ),
    const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 10,
        ),

    ]),
    const Row(
  mainAxisAlignment: MainAxisAlignment.start, // Align to the left
  children: [
    Padding(
      padding: EdgeInsets.all(4.0), 
      child: Column(
        children: [
          SizedBox(height: 4.0), 
          Text(
            'Season 1',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ), // Text 1
         // Icon(Icons.add_circle_outline_outlined, color: Colors.white), // Icon 1
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(4.0), 
      child: Column(
        children: [
          SizedBox(height: 4.0), 
// Text 2
          Icon(Icons.arrow_drop_down_outlined, color: Colors.orange,size: 30,), // Icon 2
        ],
      ),
    ),
    
    Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0), 
      child: Column(
        children: [
          SizedBox(height: 10.0), 
          Text(
            '│',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ), // Text 3
         // Icon(Icons.view_list, color: Colors.white), // Icon 3
        ],
      ),
    ),
    SizedBox(
      width:3
    ),
        Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0), 
      child: Column(
        children: [
          SizedBox(height: 10.0), 
          Text(
            'Episode 3',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ), // Text 3
         // Icon(Icons.view_list, color: Colors.white), // Icon 3
        ],
      ),
    ),


  ],
),



Padding(
  padding: const EdgeInsets.all(8.0), 
  child: Row(
    children: [
      const SizedBox(height: 8.0), 
      Image.asset(
        'assets/png/slider1 (2).png',
        width: 100, 
        height: 50, 
      ),
      const SizedBox(width: 10.0), 
      const Column(
        children: [
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nLobortis enim faucibus donec semper tempor.\n In ut velit,ornare vel iaculis dignissim. In sodales',
            style: TextStyle(
              fontSize: 6, // Adjust the font size of the text
              color: Colors.white,
            ),
            textAlign: TextAlign.center, // Center align the text
          ),
                  
                   
          
        ],
      ),
      const SizedBox(width: 9.0),
       const Icon(Icons.file_download_outlined, color: Colors.white),
    ],
    
  ),
  
),





Padding(
  padding: const EdgeInsets.all(8.0), 
  child: Row(
    children: [
     // const SizedBox(height: 8.0), 
      Image.asset(
        'assets/png/slider1 (2).png',
        width: 100, 
        height: 50, 
      ),
      const SizedBox(width: 10.0), 
      const Column(
        children: [
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nLobortis enim faucibus donec semper tempor.\n In ut velit,ornare vel iaculis dignissim. In sodales',
            style: TextStyle(
              fontSize: 6, // Adjust the font size of the text
              color: Colors.white,
            ),
            textAlign: TextAlign.center, // Center align the text
          ),
               
         

        ],
      ),
      const SizedBox(width: 9.0),
       const Icon(Icons.file_download_outlined, color: Colors.white),
    ],
    
  ),
  
),


Column(children: [


Padding(
  padding: const EdgeInsets.all(8.0), 
  child: Row(
    children: [
      const SizedBox(height: 8.0), 
      Image.asset(
        'assets/png/slider1 (2).png',
        width: 100, 
        height: 50, 
      ),
      const SizedBox(width: 10.0), 
      const Column(
        children: [
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nLobortis enim faucibus donec semper tempor.\n In ut velit,ornare vel iaculis dignissim. In sodales',
            style: TextStyle(
              fontSize: 6, // Adjust the font size of the text
              color: Colors.white,
            ),
            textAlign: TextAlign.center, // Center align the text
          ),
                   

        ],
      ),
      const SizedBox(width: 9.0),
       const Icon(Icons.file_download_outlined, color: Colors.white),
    ],
    
  ),
  
)

])
         

                 ])
                  ])
                  ])
                  ])
                  )]
                  )),
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

                  );
  }
}

