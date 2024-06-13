import 'package:flutter/material.dart';
import 'package:project/Screens/EleventhScreen.dart';
import 'package:project/Screens/NinethScreen.dart';



class TenthScreen extends StatefulWidget {
  @override
  _TenthScreenState createState() => _TenthScreenState();
}


class _TenthScreenState extends State<TenthScreen> {
    bool allowNotifications = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Colors.black,
            appBar: AppBar(
              title: const Text("App Settings",
              style: TextStyle(
                color:Colors.white
              ),),
               backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.orange,),
          onPressed: () {
                         Navigator.pop(context);
          },
        ),
        actions: [
    // IconButton(
    //   icon:const Icon(Icons.arrow_forward_ios,color: Colors.black,), // Add your desired forward arrow icon here
    //   onPressed: () {
    //                               Navigator.of(context).push(MaterialPageRoute(
    //             builder: (context) => EleventhScreen(),
    //           ));
    //  },
   // ),
        ]
            ),
      
        body: SingleChildScrollView(
       child:   Column(
                  mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Container(
  padding: const EdgeInsets.all(8.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
     

                        Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 10.0), // Adjust the left padding
        child: const Text(
          "Notifications",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    ),
    // const SizedBox(
    //   height: 15,
    // ),

Align(
  alignment: Alignment.center,
  child: Container(
    width: 330,
    height: 70,
    child: Card(
      color: const Color.fromARGB(115, 63, 60, 60),
        child: ListTile(
           contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      leading: Icon(
        Icons.notifications,
        color: Colors.white, // Customize the icon color
      ),
      title: Text("Notifications",
      style: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),),
      subtitle: Text("Turn On/Off Notifications",style: TextStyle(
        fontSize: 10,
        color: Colors.white,
      ),
      ),
      
      trailing:  Switch(
                  value: allowNotifications,
                  onChanged: (value) {
                    setState(() {
                      allowNotifications = value;
                    });
                  },
                  activeTrackColor: const Color.fromARGB(255, 18, 87, 143),
                  activeColor: Colors.white,
                ),
      
    ),
      ),
    ),
  ),


              

     
      Column(
  children: [
    Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 10.0), 
        child: const Text(
          "Network",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    ),
    const SizedBox(
      height: 5,
    ),

      
      Align(
        alignment: Alignment.center,

    child:  Container(
      
  width: 330, 

  height: 70,

  child:  Card(
      color: Color.fromARGB(115, 63, 60, 60),// Set the desired width here

    child: ListTile(
      leading: Icon(
        Icons.wifi,
        color: Colors.white, // Customize the icon color
      ),
      title: Text("Streaming Data Usage",
      style: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),),
      subtitle: Text("Automatic",style: TextStyle(
        fontSize: 10,
        color: Colors.white,
      ),
      ),
   
      
    ),
    
  ),
),
      ),
      
      // SizedBox(height: 10.0),
            Align(
        alignment: Alignment.center,

    child:  Container(
      
  width: 330, 

  height: 70,

  child: const Card(
      color: Color.fromARGB(115, 63, 60, 60),// Set the desired width here

    child: ListTile(
      leading: Icon(
        Icons.speed,
        color: Colors.white, // Customize the icon color
      ),
      title: Text("Internet Speed Test",
      style: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),),
      subtitle: Text("Check Your Network Speed",style: TextStyle(
        fontSize: 10,
        color: Colors.white,
      ),),
    ),
  ),
),
            ),
      
   //   const SizedBox(height: 10.0),

    ],
  ),
            ])
            ),


           
              Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 20.0), // Adjust the left padding
        child: const Text(
          "Legal",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    ),
    const SizedBox(
      height: 5,
    ),
      Align(
        alignment: Alignment.center,

    child:  Container(
      
  width: 330, 

  height: 70,

  child: const Card(
      color: Color.fromARGB(115, 63, 60, 60),// Set the desired width here

    child: ListTile(
      leading: Icon(
        Icons.description,
        color: Colors.white, // Customize the icon color
      ),
      title: Text("Open Source Licence",
      style: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),),

    ),
  ),
  
),
      ),
      Align(
        alignment: Alignment.center,

    child:  Container(
      
  width: 330, 

  height: 70,

  child: const Card(
      color: Color.fromARGB(115, 63, 60, 60),// Set the desired width here

    child: ListTile(
      leading: Icon(
        Icons.policy_outlined,
        color: Colors.white, // Customize the icon color
      ),
      title: Text(" Privacy Policy ",
      style: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),),

    ),
  ),
  
),
      ),
      
            Align(
        alignment: Alignment.center,

    child:  Container(
      
  width: 330, 

  height: 70,

  child: const Card(
      color: Color.fromARGB(115, 63, 60, 60),// Set the desired width here

    child: ListTile(
      leading: Icon(
        Icons.cookie,
        color: Colors.white, // Customize the icon color
      ),
      title: Text("Cookies Preferences",
      style: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),),

    ),
  ),
  
),
      ),
            Align(
        alignment: Alignment.center,

    child:  Container(
      
  width: 330, 

  height: 70,

  child: const Card(
      color: Color.fromARGB(115, 63, 60, 60),// Set the desired width here

    child: ListTile(
      leading: Icon(
        Icons.description,
        color: Colors.white, // Customize the icon color
      ),
      title: Text("Terms of Use",
      style: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),),

    ),
  ),
  
),
      ),

      
      

const SizedBox(
  height: 60,
),
Container(
      height: 2,
      color: Colors.grey, 
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
    ]),
  
            ]),
       ));
            
              
   

          
                  
                  
                  

                  
                  
                //  ])));
                  
  }
  
}                        