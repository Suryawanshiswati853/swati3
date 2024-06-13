import 'package:flutter/material.dart';
import 'package:project/Screens/EightScreen.dart';
import 'package:project/Screens/EleventhScreen.dart';
import 'package:project/Screens/FifthScreen.dart';
import 'package:project/Screens/FourScreen.dart';
import 'package:project/Screens/TenthScreen.dart';
import 'package:project/Screens/mainPage.dart';
import 'package:project/components/Animation_Screen.dart/animation_screen.dart';



class NinethScreen extends StatefulWidget {
  @override
  _NinethScreenState createState() => _NinethScreenState();
}


class _NinethScreenState extends State<NinethScreen> {
     int _selectedIndex = 3;
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





// class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Colors.black,
            appBar: AppBar(
               backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.orange,),
          onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SlideInAnimatedContainer(child: EightScreen()),
              ));
          },
        ),
        actions: [
  
        ]
            ),


        //backgroundColor: Colors.black,
      
        body: SingleChildScrollView(
       child:   Column(
            children: <Widget>[

              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                                          
                        Container(
                          
                          height: 120,
                          // width: 350,
                child: Image.asset('assets/png/avatar 7.jpg'),
                
             // Image.asset('assets/png/Groupimages.png')
             ),
           
             Padding(
  padding: const EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
  child: Column(
    children: <Widget>[
      const Row(
        children: <Widget>[
                    Expanded(
            child: Text(
              "Aranya Prakash Mahapatra",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
         // ),

          // Expanded(
          //   child: Text(
          //     "Another Text",
          //     style: TextStyle(
          //       fontSize: 16, // Adjust the font size as needed
          //       color: Colors.white, // Adjust the text color as needed
          //     ),
          //   ),
          ),
        ],
      ),
    //  SizedBox(height: 10), 
      Padding(
  padding: const EdgeInsets.all(10),
  child: Column(
    children: <Widget>[
      const Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: <Widget>[
          Icon(
            Icons.edit,
            color: Colors.white, 
          size: 20,
          ),
          SizedBox(width: 5),
          Text(
            "Manage Profile",
            style: TextStyle(
              fontSize: 16, // Adjust the font size as needed
              color: Colors.white, // Adjust the text color as needed
            ),
          ),
        ],
      ),
                const SizedBox(height: 5), // Add some space between the icon and text

      Container(
  color: const Color.fromARGB(115, 31, 29, 29),
  width: 390,
  height: 50,
  child: const Opacity(
    opacity: 0.9,
    child: Card(
      color: Color.fromARGB(115, 31, 29, 29),
      elevation: 29,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.subscriptions,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Subscriptions",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  ),
),
Container(
  color: const Color.fromARGB(115, 31, 29, 29),
  width: 380,
  height: 50,
  child: const Opacity(
    opacity: 0.9,
    child: Card(
      color: Color.fromARGB(115, 31, 29, 29),
      elevation: 29,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "App Settings",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  ),
),
InkWell(
  onTap: () {
    
  },
  child: Container(
    color: const Color.fromARGB(115, 31, 29, 29),
    width: 380,
    height: 50,
    child: const Opacity(
      opacity: 0.9,
      child: Card(
        color: Color.fromARGB(115, 31, 29, 29),
        elevation: 29,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Account Settings",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    ),
  ),
),
Container(
  color: const Color.fromARGB(115, 31, 29, 29),
  width: 380,
  height: 50,
  child: const Opacity(
    opacity: 0.9,
    child: Card(
      color: Color.fromARGB(115, 31, 29, 29),
      elevation: 29,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.help,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Help",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  ),
),
Container(
  color: const Color.fromARGB(115, 31, 29, 29),
  width: 380,
  height: 50,
  child: const Opacity(
    opacity: 0.9,
    child: Card(
      color: Color.fromARGB(115, 31, 29, 29),
      elevation: 29,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.alarm_add_sharp,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Watch History",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                 Text(
                  "Clear",
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  ),
),
const SizedBox(
  height: 50,
),
Container(
      height: 2, // Height of the grey underline
      color: Colors.grey, // Grey underline color
      width: double.infinity,
    ),
    const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.logout, // Logout icon
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Logout",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
    ]),    ]),
    
  


                   

  )],
      ),
   // ],
  
             ),


                        
                      




//                     
                    const SizedBox(
                      height: 70,
                    ),
                    

                  

            ]),
            
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

                  
                  );
                  
                //  ])));
                  
  }
  
}                        